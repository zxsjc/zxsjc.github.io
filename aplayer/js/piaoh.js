
var stop, staticx;
var img = new Image();
var sakuraImage = "img/huaban.png";
img.src = sakuraImage;
var mapleLeavesImage = "img/yinghua_1.png";
var snowflakeImage = "img/xuehua.png";
var leafImage = "img/yinghua_2.png";
function FallingObject(x, y, s, r, fn) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.r = r;
    this.fn = fn;
}
FallingObject.prototype.draw = function (cxt) {
    cxt.save();
    var xc = 100 * this.s / 4;
    cxt.translate(this.x, this.y);
    cxt.rotate(this.r);
    cxt.drawImage(img, 0, 0, 100 * this.s, 100 * this.s)
    cxt.restore();
}
FallingObject.prototype.update = function () {
    this.x = this.fn.x(this.x, this.y);
    this.y = this.fn.y(this.y, this.y);
    this.r = this.fn.r(this.r);
    if (this.x > window.innerWidth ||
        this.x < 0 ||
        this.y > window.innerHeight ||
        this.y < 0
    ) {
        this.r = getRandom('fnr');
        if (Math.random() > 0.4) {
            this.x = getRandom('x');
            this.y = 0;
            this.s = getRandom('s');
            this.r = getRandom('r');
        } else {
            this.x = window.innerWidth;
            this.y = getRandom('y');
            this.s = getRandom('s');
            this.r = getRandom('r');
        }
    }
}
FallingObjectList = function () {
    this.list = [];
}
FallingObjectList.prototype.push = function (fallingObject) {
    this.list.push(fallingObject);
}
FallingObjectList.prototype.update = function () {
    for (var i = 0, len = this.list.length; i < len; i++) {
        this.list[i].update();
    }
}
FallingObjectList.prototype.draw = function (cxt) {
    for (var i = 0, len = this.list.length; i < len; i++) {
        this.list[i].draw(cxt);
    }
}
FallingObjectList.prototype.get = function (i) {
    return this.list[i];
}
FallingObjectList.prototype.size = function () {
    return this.list.length;
}
function getRandom(option) {
    var ret, random;
    switch (option) {
        case 'x':
            ret = Math.random() * window.innerWidth;
            break;
        case 'y':
            ret = Math.random() * window.innerHeight;
            break;
        case 's':
            ret = Math.random();
            break;
        case 'r':
            ret = Math.random() * 6;
            break;
        case 'fnx':
            random = -0.5 + Math.random() * 1;
            ret = function (x, y) {
                return x + 0.5 * random - 1.7;
            };
            break;
        case 'fny':
            random = 0.1 + Math.random() * 0.7
            ret = function (x, y) {
                return y + random;
            };
            break;
        case 'fnr':
            random = Math.random() * 0.03;
            ret = function (r) {
                return r + random;
            };
            break;
    }
    return ret;
}
// 开启飘落效果
function startFalling() {
    requestAnimationFrame = window.requestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        window.oRequestAnimationFrame;
    var canvas = document.createElement('canvas'),
        cxt;
    staticx = true;
    canvas.height = window.innerHeight;
    canvas.width = window.innerWidth;
    canvas.setAttribute('style', 'position: fixed;left: 0;top: 0;pointer-events: none;z-index: -1;');
    canvas.setAttribute('id', 'canvas_sakura');
    document.getElementsByTagName('body')[0].appendChild(canvas);
    cxt = canvas.getContext('2d');
    var fallingObjectList = new FallingObjectList();
    for (var i = 0; i < 15; i++) {
        var sakura, randomX, randomY, randomS, randomR, randomFnx, randomFny;
        randomX = getRandom('x');
        randomY = getRandom('y');
        randomR = getRandom('r');
        randomS = getRandom('s');
        randomFnx = getRandom('fnx');
        randomFny = getRandom('fny');
        randomFnR = getRandom('fnr');
        sakura = new FallingObject(randomX, randomY, randomS, randomR, {
            x: randomFnx,
            y: randomFny,
            r: randomFnR
        });
        sakura.draw(cxt);
        fallingObjectList.push(sakura);
    }
    stop = requestAnimationFrame(function () {
        cxt.clearRect(0, 0, canvas.width, canvas.height);
        fallingObjectList.update();
        fallingObjectList.draw(cxt);
        stop = requestAnimationFrame(arguments.callee);
    })
}
window.onresize = function () {
    var canvasSnow = document.getElementById('canvas_snow');
    canvasSnow.width = window.innerWidth;
    canvasSnow.height = window.innerHeight;
}
function stopp() {
    if (staticx) {
        var child = document.getElementById("canvas_sakura");
        child.parentNode.removeChild(child);
        window.cancelAnimationFrame(stop);
        staticx = false;
    } else {
        startFalling();
    }
}
// 获取日期所在节气
function getJq(yyyy, mm, dd) {
    mm = mm - 1;
    var sTermInfo = new Array(0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447, 419210, 440795, 462224, 483532, 504758);
    var solarTerm = new Array("小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至");
    var solarTerms = "";
    //　　此方法是获取该日期是否为某节气
    //    var tmp1 = new Date((31556925974.7*(yyyy-1900)+sTermInfo[mm*2+1]*60000)+Date.UTC(1900,0,6,2,5));
    //    var tmp2 = tmp1.getUTCDate();
    //    if (tmp2==dd)
    //        solarTerms = solarTerm[mm*2+1];
    //    console.log(solarTerms);
    //    tmp1 = new Date((31556925974.7*(yyyy-1900)+sTermInfo[mm*2]*60000)+Date.UTC(1900,0,6,2,5));
    //    tmp2= tmp1.getUTCDate();
    //    if (tmp2==dd)
    //        solarTerms = solarTerm[mm*2];
    //　　此方法可以获取该日期处于某节气
    while (solarTerms == "") {
        var tmp1 = new Date((31556925974.7 * (yyyy - 1900) + sTermInfo[mm * 2 + 1] * 60000) + Date.UTC(1900, 0, 6, 2, 5));
        var tmp2 = tmp1.getUTCDate();
        if (tmp2 == dd) solarTerms = solarTerm[mm * 2 + 1];
        tmp1 = new Date((31556925974.7 * (yyyy - 1900) + sTermInfo[mm * 2] * 60000) + Date.UTC(1900, 0, 6, 2, 5));
        tmp2 = tmp1.getUTCDate(); if (tmp2 == dd) solarTerms = solarTerm[mm * 2];
        if (dd > 1) {
            dd = dd - 1;
        } else {
            mm = mm - 1;
            if (mm < 0) {
                yyyy = yyyy - 1; mm = 11;
            }
            dd = 31;
        }
    }
    return solarTerms;
}
$(function () {
    let now = new Date();
    let year = now.getFullYear();
    let month = now.getMonth() + 1;
    let day = now.getDate();
    // 获取节气
    let jq = getJq(year, month, day);
    if (jq == "立春" || jq == "雨水" || jq == "惊蛰" || jq == "春分" || jq == "清明" || jq == "谷雨") {
        img.src = sakuraImage;
    } else if (jq == "立夏" || jq == "小满" || jq == "芒种" || jq == "夏至" || jq == "小暑" || jq == "大暑") {
        img.src = leafImage;
    } else if (jq == "立秋" || jq == "处暑" || jq == "白露" || jq == "秋分" || jq == "寒露" || jq == "霜降") {
        img.src = mapleLeavesImage;
    } else if (jq == "立冬" || jq == "小雪" || jq == "大雪" || jq == "冬至" || jq == "小寒" || jq == "大寒") {
        img.src = snowflakeImage;
    }
    //开启飘落效果
    let system = {};
    let p = navigator.platform;
    system.win = p.indexOf("Win") == 0;
    system.mac = p.indexOf("Mac") == 0;
    system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
    if (system.win || system.mac || system.xll) {
        //如果是电脑
        startFalling();}
        else {
            startFalling();
    }
    
});
