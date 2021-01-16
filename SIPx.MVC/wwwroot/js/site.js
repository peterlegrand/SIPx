// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

    $(document).ready(function () {
        $("#Favorites").click(function () {
            var Favorite = {
                controller: 'Classification',
                action: 'Create',
                name: document.getElementById("FavoriteName").value,
                MVCFavoriteGroupId: document.getElementById("FavoriteGroupId_hidden").value
            };
            $.post("/Favorite/Add/",
                Favorite
                , function () { $("#favoriteModal").modal('hide'); });
        });
    });
