$(function () {
    $('.img-mouse').on('mouseover', function (e) {
        var pdfArr = {
            "i1": "EI2018_final.png",
            "i2": "Predicting_stock_price_trend_using machine_learning_approach_ACM_submit _publication.png",
            "i3": "GANs-face-completion.png"
        };
        var classStr = $(this).attr('class');
        var className = classStr.split(' img-mouse ')[1];
        console.log(className);
        $(this).attr('src', 'images/' + pdfArr[className]);
    });
    $('.img-mouse').on('mouseout', function (e) {
        var pdfArr = {
            "i1": "height.png",
            "i2": "finance.png",
            "i3": "cdcgans.png"
        };
        var classStr = $(this).attr('class');
        var className = classStr.split(' img-mouse ')[1];
        console.log(className);
        $(this).attr('src', 'images/' + pdfArr[className]);
    })
})