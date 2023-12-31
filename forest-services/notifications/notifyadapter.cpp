/* BEGIN_COMMON_COPYRIGHT_HEADER
 * (c)LGPL3+
 *
 * Copyright: 2021 Nicholas Yoder
 *
 * This program or library is free software; you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * END_COMMON_COPYRIGHT_HEADER */

#include "notifyadapter.h"

notifyadapter::notifyadapter(QObject *parent) : QDBusAbstractAdaptor(parent)
{
    this->setAutoRelaySignals(true);
}

notifyadapter::~notifyadapter()
{

}

void notifyadapter::GetServerInformation(QString &name, QString &vendor, QString &version, QString &spec_version)
{
    name = "forest-notification";
    vendor = "forest";
    version = "0.5";
    spec_version = "0.1";
}

void notifyadapter::CloseNotification(const uint &id)
{
    QMetaObject::invokeMethod(parent(), "closeslot", Q_ARG(uint, id));
}

void notifyadapter::Notify(
        const QString &app_name,
        const uint replaces_id,
        const QString &app_icon,
        const QString &summary,
        const QString &body,
        const QStringList &actions,
        const QVariantMap &hints,
        const int expire_timeout,
        uint &id)
{
    QMetaObject::invokeMethod(parent(), "notifyslot",
                              Q_ARG(QString, app_name),
                              Q_ARG(uint, replaces_id),
                              Q_ARG(QString, app_icon),
                              Q_ARG(QString, summary),
                              Q_ARG(QString, body),
                              Q_ARG(QStringList, actions),
                              Q_ARG(QVariantMap, hints),
                              Q_ARG(int, expire_timeout),
                              Q_ARG(uint, id) );
}
