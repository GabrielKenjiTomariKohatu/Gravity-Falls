var express = require("express");
var router = express.Router();

var pontuacaoController = require("../controllers/pontuacaoController")

router.post("/pontotempo", function (req, res) {
    pontuacaoController.pontotempo(req, res);
});


module.exports = router;
