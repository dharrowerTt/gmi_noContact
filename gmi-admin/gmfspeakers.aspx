<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="gmfspeakers.aspx.vb" Inherits="M2M_Redesign.gmfspeakers" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.bootstrap4.min.css">
  
      <style>
          body{
              margin:10px;
          }
img{
  max-width:200px;
}

button{
    background-color: #047AC1;
    border: 2px solid #047AC1;
    border-radius: 5px;
    color: white;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
    cursor: pointer;
}

tbody tr:nth-child(odd){
  background-color: #dfdfdf!important;

}

.header{
    max-width:1024px!important;
    width:100%;
    margin:0px auto;
    position:relative;
}
</style>

    <title>Global Methane Forum 2020 Speakers</title>
  </head>
  <body>
      <div style="width:100%;">
      <img src="speakerheader.png" class="header"> 
    </div>
      <h1 style="text-size:16px;text-align:center;text-align:center;">Global Methane Forum 2020 Speaker Table</h1>

              <asp:PlaceHolder ID="PlaceHolder1" runat="server" />

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
      <script src="https://cdn.datatables.net/plug-ins/1.10.16/dataRender/ellipsis.js"></script>
      <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
      <script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.bootstrap4.min.js"></script>


      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
      <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
<script>
      $(document).ready( function () {
          var oTable = $('#table_id').DataTable({
            initComplete: function () {
            this.api().columns([8]).every( function () {
                var column = this;
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $(column.header()) )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        column
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
            } );
        },
            dom: 'Bfrtip',
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            aLengthMenu: [
		   [10, 25, 50, 100, -1],
		   [10, 25, 50, 100, "All"]
		],
            buttons: [
    'copyHtml5',
    'excelHtml5'
                ],
              "columnDefs": [{
                  "targets": 7,
                  "data": "profile_link",
                  render: function (data, type, row) { 
                      
                    if(data.length > 8){
                      return '<button class="btn btn-primary" data-toggle="modal" data-content2="' + data + '" type="button" data-target="#myModal">' + "View" + '</button>' 
                     }else {
  return data
}
                  
                      }
              },
              {
                  "targets": 9,
                  "data": "waiver_link",
                  "render": function (data, type, row, meta) {
                      return '<a href="https://www.globalmethane.org/gmf2020/speakers/' + row[0] + row[1] + '/waiver/' + data + '" download>' + data + '</a>';
                  }}, {

                  "targets": 10,
                  "data": "presentation_link",
                  "render": function (data, type, row, meta) {
                      return '<a href="https://www.globalmethane.org/gmf2020/speakers/' + row[0] + row[1] + '/files/' + data + '" download>' + data + '</a>';
                  }},
                  {
        "targets": 6,
        render: function (data, type, row) { 
                      
                      if(data.length > 8){
                        return '<button class="btn btn-primary" data-toggle="modal" data-content2="' + data + '" type="button" data-target="#myModal2">' + "View" + '</button>' 
                       }else {
    return data
  }
                    
                        }
              }]
          });


      } );
    </script>


      <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="modalTitle">Profile Picture</h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
    </div>
</div>

<div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="modalTitle">Bio</h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
    </div>
</div>


      <script>
          $("#myModal").on('show.bs.modal', function (e) {
              var triggerLink = $(e.relatedTarget);
              var journal = triggerLink.data("content2");
              console.log(e.relatedTarget);
              console.log(journal);
              $("modalTitle").text("Title");
              $(this).find(".modal-body").html("<img src='" + journal + "'>");
          });
          $("#myModal2").on('show.bs.modal', function (e) {
              var triggerLink = $(e.relatedTarget);
              var journal = triggerLink.data("content2");
              console.log(e.relatedTarget);
              console.log(journal);
              $("modalTitle").text("Title");
              $(this).find(".modal-body").html("<p>" + journal + "</p>");
          });

          
      </script>
  </body>
</html>