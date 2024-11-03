

/*function showShare() {
	let thebutt = document.getElementById("shareButton");
	//let thebuttShow = document.getElementById("btnShow");
	//let thebuttHide = document.getElementById("btnHide");
	thebutt.style.visibility = "visible";
	//thebuttShow.style.visibility = "hidden";
	//thebuttHide.style.visibility = "visible";
	console.log("SHOW share button");
}

function hideShare() {
	let thebutt = document.getElementById("shareButton");
	//let thebuttShow = document.getElementById("btnShow");
	//let thebuttHide = document.getElementById("btnHide");
	thebutt.style.visibility = "hidden";
	//thebuttShow.style.visibility = "visible";
	//thebuttHide.style.visibility = "hidden";
	console.log("HIDE share button");
}*/

function showElemID(elemID) {
	let thething = document.getElementById(elemID);
	thething.style.visibility = "visible";
	console.log("SHOW "+elemID);
}

function hideElemID(elemID) {
	let thething = document.getElementById(elemID);
	thething.style.visibility = "hidden";
	console.log("HIDE "+elemID);
}

function addClassElemID(elemID,className) {
	let thething = document.getElementById(elemID);
	//thething.style.visibility = "visible";
	thething.classList.add(className);
	console.log("ADD "+className+" to "+elemID);
}

function removeClassElemID(elemID,className) {
	let thething = document.getElementById(elemID);
	//thething.style.visibility = "hidden";
	thething.classList.remove(className);
	console.log("REMOVE "+className+" from "+elemID);
}

function changeQuery(key1,value1,key2,value2) {

	//THAINORAYMFUJCET_2-6-10-15

	console.log("New Query Should Be "+key1+"="+value1);
	console.log("New Query Should Be "+key2+"="+value2);

	if ('URLSearchParams' in window) {
	  const url = new URL(window.location)
	  url.searchParams.set(key1, value1)
	  url.searchParams.set(key2, value2)
	  //location.assign(url);
	  history.pushState(null, '', url);
	  //history.replaceState(null, '', url);
	}

}

function reloadPage() {
	//location.assign(url);
	//Force a hard reload to clear the cache if supported by the browser
	window.location.reload(true);
}




 function loadParentQueryString() {

 	console.log("loadParentQueryString happening");

    var queryStringKeyValue = window.parent.location.search.replace('?', '').split('&');
    var qsJsonObject = {};
    if (queryStringKeyValue != '') {
        for (i = 0; i < queryStringKeyValue.length; i++) {
            qsJsonObject[queryStringKeyValue[i].split('=')[0]] = queryStringKeyValue[i].split('=')[1];
        }
    }

	console.log(qsJsonObject);

    return qsJsonObject;

}

function useParentLoadBoardQueryString() {

	console.log("useParentLoadBoardQueryString happening");
	let parentsLoadBoard = loadParentQueryString().loadBoard;
	console.log("Parent's loadBoard is "+parentsLoadBoard);
	
	return parentsLoadBoard;

}

function useParentLoadSecretQueryString() {

	console.log("useParentLoadSecretQueryString happening");
	let parentsLoadSecret = loadParentQueryString().loadSecret;
	console.log("Parent's loadSecret is "+parentsLoadSecret);
	
	return parentsLoadSecret;

}




function copyToClipboard(string) {

  if (navigator.canShare) {
    navigator.share({
      //title: "Sneakle",
      //text: string,
      url: window.location.href,
    });
  } else {
    //functionality for desktop
  }
    

}




function getPathFromUrl(url) {
  return url.split("?")[0];
}

function get_window_host() {
  //return getPathFromUrl(window.location.href);
	let urlwithoutquery = window.location.origin + window.location.pathname;
	return urlwithoutquery;
}

function focus_window() {
	window.focus();
}
