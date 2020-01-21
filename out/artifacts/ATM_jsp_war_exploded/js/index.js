 function tip(){
        alert("coming!");
    }
window.onload=function(){
    /*以下是为三个<p>添加鼠标移入、移出，改变背景颜色和字体颜色的事件*/
    var oShowpages=document.getElementById("show-page").getElementsByTagName("p");
    //alert(oShowpages);
   for(var i=0;i<oShowpages.length;i++){
        //alert(oShowpages[i]);
        oShowpages[i].addEventListener("mouseover", function(){
            this.style.backgroundColor="white";
            this.getElementsByTagName("a")[0].style.color="black";
        });
        oShowpages[i].addEventListener("mouseout", function(){
            this.style.backgroundColor="rgba(0,0,0,0.5)";
            this.getElementsByTagName("a")[0].style.color="white";
        });
    }
    
    var li1=document.getElementById("li1");
    var li4=document.getElementById("li4");
    li1.onclick=li4.onclick=function(){
        alert("coming!");
    }

    
    setInterval(function(){
        var date=new Date;
        if(date.getMinutes()%2==0){
            document.body.style.background="url(./images/bg_index.jpg)";
            document.body.style.backgroundPosition="50% 50%";  
            document.body.style.backgroundRepeat="no-repeat";  
            document.body.style.backgroundAttachment="fixed";  
            document.body.style.backgroundSize="cover";
        }
        else{
            document.body.style.background="url(./images/机器人.jpg)";
            document.body.style.backgroundPosition="50% 50%";  
            document.body.style.backgroundRepeat="no-repeat";  
            document.body.style.backgroundAttachment="fixed";  
            document.body.style.backgroundSize="cover";
        }            
    },1000);
    
}