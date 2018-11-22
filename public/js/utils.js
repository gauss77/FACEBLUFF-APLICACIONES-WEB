"use strict"

let Strings = {
    transform: (function (str, o={}) {
        let regexp = /{([^{]+)}/g;
        return str.replace(regexp, function (ignore, key) {
            return (key = o[key]) == null ? '' : key;
        });
    })
}

module.exports = {
    Strings: Strings,
    Messages: {
        types: Object.freeze({
            INFO: "info",
            SUCCESS: "success",
            WARNING: "warning",
            ERROR: "error"
        })
    }
}