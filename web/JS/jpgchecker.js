function CheckFileName() {
        var fileName = document.getElementById("uploadFile").value;
        if (fileName !== "") {
            var index = fileName.lastIndexOf(".");
            if(fileName.split(index) === "jpg"){
                return true;
            }
            else{
                return false;
            }
        }
        else {
            alert("No Image Input");
            return false;
        }
        return true;
    }


