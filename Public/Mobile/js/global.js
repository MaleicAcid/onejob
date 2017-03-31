(function(){
            var colCount = 20;
            //  设置列宽
            var colWidth =  document.documentElement.clientWidth / colCount;//;document.documentElement;
            //  确定基本的font-size
            document.querySelector('html').style.fontSize = colWidth + 'px';
        })();