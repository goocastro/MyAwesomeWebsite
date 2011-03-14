// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
//
var ImgIdx = 2;
function rollIt () {  
    if(!$(this).ImageAnimating()){
      $(this).ImageSwitch({ Type:"FadeIn",
                            NewImage:document.getElementById('instapic').getAttribute('picture' + ImgIdx),
                            StartLeft: 150,
                            Speed: 500
                          });
    }

    ImgIdx++;
    if(ImgIdx>7) ImgIdx = 1;
    return false;  
  }

$(function () {  
  $('#instapic').click(rollIt)  
});  


$(function () {  
  $.ImagePreload(this.getElementById('instapic').getAttribute('picture1'));
  $.ImagePreload(this.getElementById('instapic').getAttribute('picture2'));
  $.ImagePreload(this.getElementById('instapic').getAttribute('picture3'));
  $.ImagePreload(this.getElementById('instapic').getAttribute('picture4'));
  $.ImagePreload(this.getElementById('instapic').getAttribute('picture5'));
  $.ImagePreload(this.getElementById('instapic').getAttribute('picture6'));
  $.ImagePreload(this.getElementById('instapic').getAttribute('picture7'));

  setInterval(function () {
    // body...
  }
    
  , 3000);
});  
