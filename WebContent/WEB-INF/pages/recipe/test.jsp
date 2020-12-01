<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Client Side jQuery DataTables</title>
    <!--å¼ç¨css-->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
</head>
<body>

    
       <table id="myDataTalbe" class="display" cellspacing="0" width="100%">
       <thead>
       <tr>
           <th>食譜名稱</th>
           <th>上傳日期</th>
           <th>作者</th>
           <th>今日人氣</th>
           <th>刪除</th>
           <th>Salary</th>
       </tr>
       </thead>
       <tbody>
       <tr>
           <td><a href="#">Tiger Nixon</a></td>
           <td>System Architect</td>
           <td>Edinburgh</td>
           <td>61</td>
           <td>2011/04/25</td>
           <td>$320.800,00</td>
       </tr>
       <tr>
           <td>Donna Snider</td>
           <td>Customer Support</td>
           <td>New York</td>
           <td>27</td>
           <td>2011/01/25</td>
           <td>$112.000,00</td>
       </tr>
       </tbody>
   </table>


    <!--å¼ç¨jQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <!--å¼ç¨dataTables.js-->
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
     
    <script type="text/javascript">
        $(function () {

            $("#myDataTalbe").DataTable({
                searching: true, //ééfilteråè½
                columnDefs: [{
                    targets: [3],
                    orderable: false,
                }]
            });
        });
    </script>
</body>
</html>