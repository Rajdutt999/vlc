/*****************************************************************************
 * Copyright (C) 2021 VLC authors and VideoLAN
 *
 * Authors: Benjamin Arnaud <bunjee@omega.gg>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * ( at your option ) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
 *****************************************************************************/

import QtQuick 2.11

import org.videolan.vlc 0.1

import "qrc:///widgets/" as Widgets
import "qrc:///style/"

Widgets.IconControlButton {
    size: VLCStyle.icon_medium

    iconText: VLCIcons.renderer
    text: I18n.qtr("Renderer")

    // NOTE: We want to pop the menu after the button.
    onClicked: menu.popup(this.mapToGlobal(width, 0))

    QmlRendererMenu {
        id: menu

        ctx: MainCtx

        onAboutToShow: playerControlLayout.requestLockUnlockAutoHide(true, menu)
        onAboutToHide: playerControlLayout.requestLockUnlockAutoHide(false, menu)
    }
}
