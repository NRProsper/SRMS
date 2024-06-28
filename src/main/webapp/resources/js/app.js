//Modal
$(document).ready(function() {
    function toggleActive() {
        $('.modal-container, .add-category').toggleClass('active');
    }
    $('#add-cat').click(function() {
        toggleActive();
    });
    $('#close').click(function() {
        $('.modal-container, .add-category').removeClass('active');
    });
    $(document).keyup(function(e) {
        if (e.key === "Escape") {
            $('.modal-container, .add-category').removeClass('active');
        }
    });
});

$(".menu > ul > li").click(function(e) {
    let isActive = $(this).hasClass('active');
    $(this).siblings().removeClass('active')

    // $(".menu > ul > li ul li").removeClass('active');
    // $(this).toggleClass('active', isActive);

    $(".menu > ul > li").removeClass('active');
    $(".menu > ul > li ul li").removeClass('active');




    if (!isActive) {
        $(this).addClass('active');
    }
    $(this).find('ul').slideToggle();
    $(this).siblings().find('ul').slideUp();
    $(this).siblings().find('ul').find('li').removeClass('active');
});

$(".menu > ul > li:not(:has(.sub-menu))").click(function() {
    $(".menu > ul > li:not(:has(.sub-menu))").removeClass('active');
    $(this).addClass('active');
});

// Stop the event from propagating up to the parent li
$(".menu > ul > li ul li").click(function(e) {
    e.stopPropagation();
    $(".menu > ul > li ul li").removeClass('active');
    $(this).addClass('active');

    if ($('.sidebar').hasClass('active')) {
        $(".menu > ul > li ul").slideUp();
    }
});

$(".menu-hide").click(function(e) {
    $('.sidebar').toggleClass('active');
    $('main').toggleClass('main-collapse');
});

const aside = $(".sidebar")
const topNav = $(".top-nav")

function handleAsideTablet(media_query) {
    const main = $("main");


    if(media_query.matches) {
        aside.addClass("active")
        main.addClass("main-collapse")

    }else {
        aside.removeClass("active")
        main.removeClass("main-collapse")

    }
}

const tablet_mq = window.matchMedia("(max-width : 1250px)")

handleAsideTablet(tablet_mq)

tablet_mq.addEventListener("change", (e) => {
    handleAsideTablet(e)
})



async function getProvinces() {

    const settings = {
        async: true,
        crossDomain: true,
        url: 'https://rwanda.p.rapidapi.com/provinces',
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '924fd5b68fmshd7305283e7ed99cp14e955jsn491159d0b211',
            'X-RapidAPI-Host': 'rwanda.p.rapidapi.com'
        }
    };

    $("province").empty()

    $.ajax(settings).done(function (response) {
        response.data.forEach((province) => {
            $("#province").append($('<option>', {
                value: province,
                text: province
            }));
        })
    });

}

getProvinces();

async function getDistricts(province) {
    const settings = {
        async: true,
        crossDomain: true,
        url: `https://rwanda.p.rapidapi.com/districts?p=${province}`,
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '924fd5b68fmshd7305283e7ed99cp14e955jsn491159d0b211',
            'X-RapidAPI-Host': 'rwanda.p.rapidapi.com'
        }
    };

    $.ajax(settings).done(function (response) {
        response.data.forEach((district) => {
            $("#district").append($('<option>', {
                value: district,
                text: district
            }))
        })
    })

}

async function getSectors(province, district) {
    const settings = {
        async: true,
        crossDomain: true,
        url: `https://rwanda.p.rapidapi.com/sectors?p=${province}&d=${district}`,
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '924fd5b68fmshd7305283e7ed99cp14e955jsn491159d0b211',
            'X-RapidAPI-Host': 'rwanda.p.rapidapi.com'
        }
    };

    $.ajax(settings).done(function (response) {
        response.data.forEach((sector) => {
            $("#sector").append($('<option>', {
                value: sector,
                text: sector
            }))
        })
    })
}

async function getCell(province, district, sector) {
    const settings = {
        async: true,
        crossDomain: true,
        url: `https://rwanda.p.rapidapi.com/cells?p=${province}&d=${district}&s=${sector}`,
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '924fd5b68fmshd7305283e7ed99cp14e955jsn491159d0b211',
            'X-RapidAPI-Host': 'rwanda.p.rapidapi.com'
        }
    };

    $.ajax(settings).done(function (response) {
        response.data.forEach((cell) => {
            $("#cell").append($('<option>', {
                value: cell,
                text: cell
            }))
        })
    })
}

async function getVillages(province, district, sector, cell){
    const settings = {
        async: true,
        crossDomain: true,
        url: `https://rwanda.p.rapidapi.com/villages?p=${province}&d=${district}&s=${sector}&c=${cell}`,
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '924fd5b68fmshd7305283e7ed99cp14e955jsn491159d0b211',
            'X-RapidAPI-Host': 'rwanda.p.rapidapi.com'
        }
    };

    $.ajax(settings).done(function (response) {
        response.data.forEach((village) => {
            $("#village").append($('<option>', {
                value: village,
                text: village
            }))
        })
    })
}

$(document).ready(function () {
    $("#province").on("change", function () {
        $("#district").empty()
        getDistricts($(this).val().toLowerCase())
    })

    $("#district").on("change", function () {
        $("#sector").empty()
        getSectors($("#province").val().toLowerCase(), $(this).val().toLowerCase())
    })

    $("#sector").on("change", function () {
        $("#cell").empty()
        getCell($("#province").val().toLowerCase(), $("#district").val().toLowerCase(), $(this).val().toLowerCase())
    })

    $("#cell").on("change", function () {
        $("#village").empty();
        getVillages($("#province").val().toLowerCase(), $("#district").val().toLowerCase(), $("#sector").val().toLowerCase(), $(this).val().toLowerCase())
    })



})








//Servlet Operations
