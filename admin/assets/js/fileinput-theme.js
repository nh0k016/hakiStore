/*!
 * bootstrap-fileinput v5.1.3
 * http://plugins.krajee.com/file-input
 *
 * Font Awesome icon theme configuration for bootstrap-fileinput. Requires font awesome assets to be loaded.
 *
 * Author: Kartik Visweswaran
 * Copyright: 2014 - 2020, Kartik Visweswaran, Krajee.com
 *
 * Licensed under the BSD-3-Clause
 * https://github.com/kartik-v/bootstrap-fileinput/blob/master/LICENSE.md
 */
(function($) {
    "use strict";

    $.fn.fileinputThemes.fa = {
        fileActionSettings: {
            removeIcon: '<i class="fas fa-trash-alt"></i>',
            uploadIcon: '<i class="fas fa-upload"></i>',
            uploadRetryIcon: '<i class="fas fa-redo-alt"></i>',
            downloadIcon: '<i class="fas fa-arrow-circle-down"></i>',
            zoomIcon: '<i class="fas fa-search-plus"></i>',
            dragIcon: '<i class="fas fa-arrows-alt"></i>',
            indicatorNew: '<i class="fas fa-plus-circle"></i>',
            indicatorSuccess: '<i class="fas fa-check-circle"></i>',
            indicatorError: '<i class="fas fa-exclamation-circle"></i>',
            indicatorLoading: '<i class="far fa-hourglass"></i>',
            indicatorPaused: '<i class="fas fa-pause"></i>'
        },
        layoutTemplates: {
            fileIcon: '<i class="fas fa-file"></i>'
        },
        previewZoomButtonIcons: {
            prev: '<i class="fas fa-caret-left"></i>',
            next: '<i class="fas fa-caret-right"></i>',
            toggleheader: '<i class="fas fa-arrows-alt-v"></i>',
            fullscreen: '<i class="fas fa-arrows-alt-v"></i>',
            borderless: '<i class="fas fa-external-link-square-alt"></i>',
            close: '<i class="far fa-times-circle"></i>'
        },
        previewFileIcon: '<i class="fas fa-file"></i>',
        browseIcon: '<i class="far fa-folder-open"></i>',
        removeIcon: '<i class="fas fa-trash-alt"></i>',
        cancelIcon: '<i class="fas fa-ban"></i>',
        pauseIcon: '<i class="fas fa-pause"></i>',
        uploadIcon: '<i class="fas fa-upload"></i>',
        msgValidationErrorIcon: '<i class="fas fa-exclamation-circle"></i>'
    };
})(window.jQuery);