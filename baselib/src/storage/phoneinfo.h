/*
 * Copyright 2007-2017 The Wazo Authors  (see the AUTHORS file)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version, with a Section 7 Additional
 * Permission as follows:
 *   This notice constitutes a grant of such permission as is necessary
 *   to combine or link this software, or a modified version of it, with
 *   the OpenSSL project's "OpenSSL" library, or a derivative work of it,
 *   and to copy, modify, and distribute the resulting work. This is an
 *   extension of the special permission given by Trolltech to link the
 *   Qt code with the OpenSSL library (see
 *   <http://doc.trolltech.com/4.4/gpl.html>). The OpenSSL library is
 *   licensed under a dual license: the OpenSSL License and the original
 *   SSLeay license.
 *
 * This programm is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __PHONEINFO_H__
#define __PHONEINFO_H__

#include <QString>
#include <QStringList>
#include <QVariant>
#include <QVariantMap>

#include "xinfo.h"
#include "baselib_export.h"

class BASELIB_EXPORT PhoneInfo : public XInfo
{
    public:
        PhoneInfo(const QString &, const QString &);
        virtual ~PhoneInfo() {}
        bool updateConfig(const QVariantMap &);
        bool updateStatus(const QVariantMap &);
        virtual const QString &number() const { return m_number; };
        const QString & identity() const { return m_identity; };
        const QString & iduserfeatures() const { return m_iduserfeatures; };
        QString xid_user_features() const;

        const QString & hintstatus() const { return m_hintstatus; };
    private:
        QString m_number;
        QString m_identity;
        QString m_iduserfeatures;
        QString m_hintstatus;
};

namespace PhoneHint {
    static QString available = "0";
    static QString in_use = "1";
    static QString ringing = "8";
};

#endif
