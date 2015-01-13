/**
 * Copyright (c) 2015 Damien Tardy-Panis
 *
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 **/

import QtQuick 2.0
import Sailfish.Silica 1.0

import Comics 1.0

import "../delegates"

Page {

    allowedOrientations: Orientation.All

    SilicaGridView {
        id: gridView

        property int cellSize: window.portrait ? parent.width / 2 : parent.width / 4

        anchors.fill: parent
        cellWidth: cellSize
        cellHeight: cellSize
        header: PageHeader {
            title: "Daily Comics"
        }
        delegate: ComicsGridDelegate { }
        model: comicsModel

        PullDownMenu {
            MenuItem {
                text: "Settings"
                onClicked: pageStack.push(Qt.resolvedUrl("ComicsSettingsPage.qml"))
            }
        }

        VerticalScrollDecorator { flickable: gridView }

        function _goToComicPage(id, image) {
            pageStack.push(Qt.resolvedUrl("ComicPage.qml"), {"comicId": id})
        }
    }

    FavoriteComicsModel {
        id: comicsModel
        Component.onCompleted: comicsModel.loadAll()
    }

}

