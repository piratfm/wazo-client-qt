/* XiVO Client
 * Copyright (C) 2007-2012, Avencall
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

#include "message_factory.h"

QVariantMap MessageFactory::subscribeCurrentCalls()
{
    QVariantMap message = MessageFactory::baseMessage("subscribe");
    message["message"] = "current_calls";

    return message;
}

QVariantMap MessageFactory::answer()
{
    return MessageFactory::baseMessage("answer");
}

QVariantMap MessageFactory::hangup()
{
    return MessageFactory::baseMessage("hangup");
}

QVariantMap MessageFactory::holdSwitchboard()
{
    return MessageFactory::baseMessage("hold_switchboard");
}

QVariantMap MessageFactory::unholdSwitchboard(const QString &unique_id)
{
    QVariantMap message = MessageFactory::baseMessage("unhold_switchboard");
    message["unique_id"] = unique_id;

    return message;
}

QVariantMap MessageFactory::baseMessage(const QString &class_name)
{
    QVariantMap message;
    message["class"] = class_name;
    return message;
}