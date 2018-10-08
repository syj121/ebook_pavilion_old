$(function() {

        var $fullText = $('.admin-fullText');
        $('#admin-fullscreen').on('click', function() {
            $.AMUI.fullscreen.toggle();
        });

        $(document).on($.AMUI.fullscreen.raw.fullscreenchange, function() {
            $fullText.text($.AMUI.fullscreen.isFullscreen ? '退出全屏' : '开启全屏');
        });


        var dataType = $('body').attr('data-type');

        $('.tpl-switch').find('.tpl-switch-btn-view').on('click', function() {
            $(this).prev('.tpl-switch-btn').prop("checked", function() {
                    if ($(this).is(':checked')) {
                        return false
                    } else {
                        return true
                    }
                })
                // console.log('123123123')

        })

         // ==========================
         // 侧边导航下拉列表
         // ==========================

         //使用on语法，为未来的元素绑定事件
         $(document).on('click', '.tpl-left-nav-link-list', function(){
           $(this).siblings('.tpl-left-nav-sub-menu').slideToggle(80)
               .end()
               .find('.tpl-left-nav-more-ico').toggleClass('tpl-left-nav-more-ico-rotate');
         })

     // $('.tpl-left-nav-link-list').on('click', function() {
     //         $(this).siblings('.tpl-left-nav-sub-menu').slideToggle(80)
     //             .end()
     //             .find('.tpl-left-nav-more-ico').toggleClass('tpl-left-nav-more-ico-rotate');
     //     })
         // ==========================
         // 头部导航隐藏菜单
         // ==========================

         $(document).on("click", ".tpl-header-nav-hover-ico", function(){
            $('.tpl-header-nav-hover-ico').on('click', function() {
                $('.tpl-left-nav').toggle();
                $('.tpl-content-wrapper').toggleClass('tpl-content-wrapper-hover');
            })
         })

     // $('.tpl-header-nav-hover-ico').on('click', function() {
     //     $('.tpl-left-nav').toggle();
     //     $('.tpl-content-wrapper').toggleClass('tpl-content-wrapper-hover');
     // })

})

