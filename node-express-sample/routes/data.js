var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});


router.post('/', (req, res) => {
  const data  = req.body.data
  const template_ext  = req.body.template
  console.log(data)
  console.log(template_ext)
  const template = "data."+template_ext
  res.render(template, { data: data });
})


module.exports = router;
