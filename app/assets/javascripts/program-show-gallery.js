// For keeping track of which image is being displayed
var curnum = 1;

/**
 * Display larger image when thumbnail is being clicked
 *
 * @param   self    The clicked thumbnail img DOM
 */
var galleryClick = function (self) {
    $('.selected-thumbnail').removeClass('selected-thumbnail');
    $(self).addClass('selected-thumbnail');

    var next = $(self).attr('src').substring(0, $(self).attr('src').indexOf('_thumbnail')) + '.jpg';

    // Gradually animate in
    $('#gallery-main').animate({
        opacity: 0
    }, 100, function () {
        $('#gallery-main').attr('src', next);
        $('#gallery-main').animate({
            opacity: 1
        }, 100);
    });

    // Recalculate the currently displayed image number
    curnum = parseInt(next.substring(next.length - 5, next.length - 4));
}

/**
 * Display next image when next button is being clicked
 *
 * @param   self    The next button DOM
 */
var galleryNext = function (self) {
    if (curnum === 6) {
        curnum = 1;
    } else {
        curnum += 1;
    }

    // Correction if not in right range
    if (curnum > 6 || curnum < 1) {
        curnum = 1;
    }

    // Get the next thumbnail to set as selected
    var thumbnailId = '#gallery-thumbnail-' + curnum;
    $('.selected-thumbnail').removeClass('selected-thumbnail');
    $(thumbnailId).addClass('selected-thumbnail');

    // Find out the next image to display
    var next = $(thumbnailId).attr('src').substring(0, $(thumbnailId).attr('src').indexOf('_thumbnail')) + '.jpg';

    // Gradually animate in
    $('#gallery-main').animate({
        opacity: 0
    }, 100, function () {
        $('#gallery-main').attr('src', next);
        $('#gallery-main').animate({
            opacity: 1
        }, 100);
    });
}

/**
 * Display previous image when next button is being clicked
 *
 * @param   self    The previous button DOM
 */
var galleryBack = function (self) {
    // Loop back if maximum
    if (curnum === 1) {
        curnum = 6;
    } else {
        curnum -= 1;
    }

    // Correction if not in right range
    if (curnum > 6 || curnum < 1) {
        curnum = 1;
    }

    // Get the previous thumbnail to set as selected
    var thumbnailId = '#gallery-thumbnail-' + curnum;
    $('.selected-thumbnail').removeClass('selected-thumbnail');
    $(thumbnailId).addClass('selected-thumbnail');

    // Find out the last image to display
    var next = $(thumbnailId).attr('src').substring(0, $(thumbnailId).attr('src').indexOf('_thumbnail')) + '.jpg';

    // Gradually animate in
    $('#gallery-main').animate({
        opacity: 0
    }, 100, function () {
        $('#gallery-main').attr('src', next);
        $('#gallery-main').animate({
            opacity: 1
        }, 100);
    });
}
