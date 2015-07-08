/* XiVO Client
 * Copyright (C) 2007-2015 Avencall
 *
 * This file is part of XiVO Client.
 *
 * XiVO Client is free software: you can redistribute it and/or modify
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
 * XiVO Client is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with XiVO Client.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __PEOPLE_ENTRY_MODEL_H__
#define __PEOPLE_ENTRY_MODEL_H__

#include <QAbstractTableModel>
#include <QList>
#include <QMap>
#include <QModelIndex>
#include <QPair>
#include <QString>
#include <QVariant>
#include <QWidget>

#include "people_enum.h"
#include "people_entry.h"

class PeopleEntryModel : public QAbstractTableModel
{
    Q_OBJECT

    typedef QPair<QString, int> RelationID;
    typedef QPair<QString, QString> RelationSourceID;

    public:
        PeopleEntryModel(QWidget *parent = NULL);

        int rowCount(const QModelIndex &parent = QModelIndex()) const;
        int columnCount(const QModelIndex &parent=QModelIndex()) const;

        QVariant data(const QModelIndex&, int role = Qt::DisplayRole) const;
        QVariant headerData(int,
                            Qt::Orientation,
                            int) const;
        int getNameColumnIndex() const;
        bool favoriteStatus(const QVariantMap &unique_source_entry_id) const;
        void clearEntries();
        void parseAgentStatusUpdate(const QVariantMap &result);
        void parseEndpointStatusUpdate(const QVariantMap &result);
        void parseUserStatusUpdate(const QVariantMap &result);
        void parsePeopleFavoriteUpdate(const QVariantMap &result);
        void parsePeopleHeadersResult(const QVariantMap &command);
        void parsePeopleSearchResult(const QVariantMap &result);

    private:
        void refreshEntry(int entry_index);
        QVariant dataDecoration(const PeopleEntry & entry, int column) const;
        QVariant dataIndicatorColor(const PeopleEntry & entry, int column) const;
        QVariant dataSortFilter(const PeopleEntry & entry, int column) const;
        void addField(const QString &name, const QString &type);
        void clearFields();
        int getFavoriteColumnIndex() const;
        void setAgentStatusFromAgentId(const RelationID &id, const QString &status);
        void setEndpointStatusFromEndpointId(const RelationID &id, int status);
        void setUserStatusFromUserId(const RelationID &id, const QString &status);
        void setFavoriteStatusFromSourceId(const RelationSourceID &id, bool status);

        QString headerText(int column) const;
        enum ColumnType headerType(int column) const;

        QList< QPair<QString, enum ColumnType> >  m_fields;
        QList<PeopleEntry> m_people_entries;
        QMap<QString, ColumnType> m_type_map;
};

#endif
