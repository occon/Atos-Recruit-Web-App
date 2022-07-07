function next() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    id++;
    x = document.getElementById(id + "");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    if (id > 1) {
        prev.style.display = "block";
    }
    if (id == 6) {
        next.style.display = "none";
        submit.style.display = "block";
    }
}

function prev() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    id--;
    x = document.getElementById(id + "");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    if (id == 1) {
        prev.style.display = "none";
    }
    if (id < 6) {
        next.style.display = "block";
        submit.style.display = "none";
    }
}

function personalInfo() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    x = document.getElementById("1");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    prev.style.display = "none";
    next.style.display = "block";
    submit.style.display = "none";
}

function contact() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    x = document.getElementById("2");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    prev.style.display = "block";
    next.style.display = "block";
    submit.style.display = "none";
}

function education() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    x = document.getElementById("3");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    prev.style.display = "block";
    next.style.display = "block";
    submit.style.display = "none";
}

function experience() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    x = document.getElementById("4");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    prev.style.display = "block";
    next.style.display = "block";
    submit.style.display = "none";
}

function skills() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    x = document.getElementById("5");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    prev.style.display = "block";
    next.style.display = "block";
    submit.style.display = "none";
}

function aboutMe() {
    var id = 1;
    var x = document.getElementById(id + "");
    while (x.style.display === "none") {
        id++;
        x = document.getElementById(id + "");
    }
    x.style.display = "none";
    x = document.getElementById("6");
    x.style.display = "block";
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var submit = document.getElementById("submit");
    prev.style.display = "block";
    next.style.display = "none";
    submit.style.display = "block";
}

function validate() {
    if (document.getElementById("1").style.display === "block") {

        if (document.getElementById("inputMState").value == "0") {
            alert("Please provide your Marital State!");
            document.getElementById("inputMState").focus();
            return false;
        }
        if (document.getElementById("inputNationality").value == "0") {
            alert("Please provide your Nationality!");
            document.getElementById("inputNationality").focus();
            return false;
        }
        if (document.getElementById("inputDate").value == "") {
            alert("Please provide your Birth Date!");
            document.getElementById("inputDate").focus();
            return false;
        }
        if (document.getElementById("inputGender").value == "0") {
            alert("Please provide your Gender!");
            document.getElementById("inputGender").focus();
            return false;
        }
        if (document.getElementById("inputProfile").value == "0") {
            alert("Please provide your Profile!");
            document.getElementById("inputProfile").focus();
            return false;
        }
        //if (document.getElementById("customFile").value == "") {
        //    alert("Please provide your Profile Picture!");
        //    document.getElementById("customFile").focus();
        //    return false;
        //}
        next();
        document.getElementById("personalInfo").className = "active";
        return true;
    }

    if (document.getElementById("2").style.display === "block") {
        if (document.getElementById("inputPhone").value == "") {
            alert("Please provide your Phone Number!");
            document.getElementById("inputPhone").focus();
            return false;
        }
        if (document.getElementById("inputAddress").value == "") {
            alert("Please provide your Adress!");
            document.getElementById("inputAddress").focus();
            return false;
        }
        if (document.getElementById("inputZip").value == "") {
            alert("Please provide a zip in the format #####.");
            document.getElementById("inputZip").focus();
            return false;
        }
        if (document.getElementById("inputCity").value == "") {
            alert("Please provide your City!");
            document.getElementById("inputCity").focus();
            return false;
        }
        if (document.getElementById("inputState").value == "") {
            alert("Please provide your State!");
            document.getElementById("inputState").focus();
            return false;
        }
        if (document.getElementById("inputCountry").value == "0") {
            alert("Please provide your Country!");
            document.getElementById("inputCountry").focus();
            return false;
        }
        next();
        document.getElementById("contact").className = "active";
        return true;
    }

    if (document.getElementById("3").style.display === "block") {
        if (document.getElementById("inputSchoolName").value == "") {
            alert("Please provide your School Name.");
            document.getElementById("inputSchoolName").focus();
            return false;
        }
        if (document.getElementById("inputSchoolLoc").value == "") {
            alert("Please provide your School Location.");
            document.getElementById("inputSchoolLoc").focus();
            return false;
        }
        if (document.getElementById("inputDegree").value == "") {
            alert("Please provide you Degree.");
            document.getElementById("inputDegree").focus();
            return false;
        }
        if (document.getElementById("inputFStudy").value == "") {
            alert("Please provide you Study Field.");
            document.getElementById("inputFStudy").focus();
            return false;
        }
        next();
        document.getElementById("education").className = "active";
        return true;
    }
    if (document.getElementById("4").style.display === "block") {
        next();
        document.getElementById("experience").className = "active";
        return true;
    }

    if (document.getElementById("5").style.display === "block") {
        next();
        document.getElementById("skills").className = "active";
        return true;
    }
}