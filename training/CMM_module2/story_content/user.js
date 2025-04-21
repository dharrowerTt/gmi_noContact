function ExecuteScript(strId)
{
  switch (strId)
  {
      case "6OnccX3nMLR":
        Script1();
        break;
  }
}

function Script1()
{
  if ($('.area-secondary').is(":visible")){
$('.area-secondary').fadeOut()
}else{
$('.area-secondary').fadeIn()
}
}

