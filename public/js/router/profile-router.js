'use strict'

// private libs
const {
    MiddleWares
} = require("../utils");

// public libs
const express = require("express");

const router = express.Router();

router.use(MiddleWares.checkUserLogged);

router.get("/", (request, response) => {
    response.status(200);
    response.render("profile");
});

module.exports = {
    profileRouter: router
};