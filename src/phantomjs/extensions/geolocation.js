(function (geolocation) {
    'use strict';
    if (geolocation) {
        return;
    }

    geolocation = window.navigator.geolocation = {};
    geolocation.getCurrentPosition = function (callback) {

        callback({
            coords: {
                latitude: 53.47159,
                longitude: -2.29936
            }
        });
    };

    geolocation.watchPosition = geolocation.getCurrentPosition;

})(navigator.geolocation);