function ExecuteScript(strId)
{
  switch (strId)
  {
      case "5eTOgrYkrCP":
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

