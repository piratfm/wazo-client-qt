# build projects contained in subdirectories
TEMPLATE = subdirs
SUBDIRS  = \
    src/xlets/agents \
    src/xlets/agentdetails \
    src/xlets/conference \
    src/xlets/directory \
    src/xlets/datetime \
    src/xlets/history \
    src/xlets/identity \
    src/xlets/queues \
    src/xlets/queue_members \
    src/xlets/queue_entries \
    src/xlets/services \
    src/xlets/switchboard \

xletdebug {
    SUBDIRS += src/xlets/debug
}
