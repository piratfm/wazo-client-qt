#!/usr/bin/env bash

# This script pulls translation files from Transifex
# Files are stored there in two big files, one for xivoclient, one for baselib
# We duplicate the big files for every .ts file we need, then we use lupdate to
# strip them down.

# To add a new translation :
# find . -name '*.pro' -exec sed -i -e 's|^TRANSLATIONS += $${\?ROOT_DIR}\?/i18n/\(.*\)_en.ts|\0\nTRANSLATIONS += $$ROOT_DIR/i18n/\1_it.ts|' {} \;
# find . -name '*.qrc' -exec sed -i -e 's|^\\( *\\)<file>\\(.*\\)obj/\\(.*\\)_fr.qm</file>|\\0\\n\\1<file>\\2obj/\\3_de.qm</file>|' {} \\;


function usage {
    echo "Usage : $0 [help|pull|update]"
    echo
    echo "help : display this message"
    echo "pull : get translations from Transifex"
    echo "update : update translation files from source"
}

function pull_from_transifex {
    if [ ! -d .tx ]
    then
        tx init --host https://www.transifex.net
    fi

    tx set --auto-remote  https://www.transifex.net/projects/p/xivo/
    tx pull -r xivo.xivo-client -a
    tx pull -r xivo.xivo-client-baselib -a
}

function copy_from_transifex_to_git {
    # locale takes values as "fr.ts", "de.ts", "nl.ts" ...
    for locale in $(ls translations/xivo.xivo-client-baselib)
    do
        cp "translations/xivo.xivo-client-baselib/$locale" "baselib/baselib_$locale"
    done
    for locale in $(ls translations/xivo.xivo-client)
    do
        for ts in $(find xivoclient -name "*_en.ts")
        do
            cp "translations/xivo.xivo-client/$locale" "${ts%en.ts}$locale"
        done
    done

    # Strip useless translations
    lupdate_all
}

function lupdate_all {
    lupdate xivoclient/*.pro -no-obsolete
    lupdate baselib/baselib.pro -no-obsolete
}

function merge_all_translations {
    if hash lconvert
    then
        rm xivoclient/i18n/all_en.ts
        lconvert xivoclient/i18n/*_en.ts -o xivoclient/i18n/all_en.ts
    fi
}

if [ $# -eq 0 ]
then
    usage
    exit 1
fi

case $1 in
    pull)
        pull_from_transifex
        copy_from_transifex_to_git
        ;;
    update)
        lupdate_all
        merge_all_translations
        ;;
    *)
        usage
        exit 1
        ;;
esac