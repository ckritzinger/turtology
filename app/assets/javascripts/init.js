var turtle = null;
var logo = null;
var canvas;
var form;
var sprite;
var textOutput;
var oldcode;
var fast;
var out;
var DelayTurtle;
var cm;
var maxSpeed = 1000;

function setup() {
    logo = new Logo();
    turtle = new DelayTurtle(canvas, sprite, maxSpeed, false);
    logo.setTurtle(turtle);
    logo.setTextOutput(textOutput);
}

function init(canvas_id, turtle_id, form_id, oldcode_id, textoutput_id) {
    canvas = document.getElementById(canvas_id);
    form = document.getElementById(form_id);
    textOutput = document.getElementById(textoutput_id);
    sprite = document.getElementById(turtle_id);

    // I hate opera, I hate firefox.
    canvas.style.width = 500;
    canvas.width = 500;

    canvas.style.height = 500;
    canvas.height = 500;

    oldcode = document.getElementById(oldcode_id);
    setup();
}

function run(speed, drawbits) {
    turtle.stop();
    clearcanvas();
    logo.setTurtle(turtle = new DelayTurtle(canvas, sprite, speed, drawbits));
    turtle.start();
    cm.save();
    out = logo.run($('#code').val());
    if (out && out.type === "error") {
        alert(out.data);
        setup();
    }
}

function stop() {
    turtle.stop();
}

function clearcanvas() {
    var ctx = canvas.getContext('2d');
    ctx.fillStyle = "rgb(255,255,255)";
    ctx.fillRect(0, 0, 500, 500);
    textOutput.innerHTML = "";
}

function saveProject(){
    $('#imagedata').val(canvas.toDataURL('image/png'));
    $('#project-form').submit();
}

$(document).ready(function() {
    console.log("looking for ide");
    $('.ide').each(function() {
        console.log("found ide, initialising");
        cm = CodeMirror.fromTextArea(document.getElementById('code'), {
            lineNumbers: true,
            placeholder: 'write some logo code\n(try "fd 50")',
            readOnly: $("#code").attr("readonly") ? "nocursor" : false
        });
        if($('#canvas').length) {
            init('canvas', 'turtle', 'input', 'oldcode', 'textOutput');
            clearcanvas();
            run(1, false);
        }
        $('#project-form').on('ajax:success',function(e,data,status,xhr){
            if(data.success) {
                $('#saved-notification').fadeIn(500, function(){$('#saved-notification').fadeOut(1000)});
                console.log("saved")
                $('#project_id').val(data.project_id);
            }
        });
    });
});
