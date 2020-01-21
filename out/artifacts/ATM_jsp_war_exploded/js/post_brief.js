window.onload=function(){
	//为文章标题的文字加鼠标悬浮出现下划线效果
	var oList_group = document.getElementById("list-group");
	var aA=oList_group.getElementsByTagName("a");
	for(var i=1;i<aA.length;i++){
		aA[i].style.color="#428bca";
		aA[i].addEventListener("mouseover", function(){
			//this.style.borderBottom="2px solid #428bca"
			this.style.textDecoration="underline";
			}
		)
		aA[i].addEventListener("mouseout", function(){
			this.style.textDecoration="none";
		})
	}
}

	
