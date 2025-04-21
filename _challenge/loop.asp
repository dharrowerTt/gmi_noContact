<%

Dim conn

Set conn = Server.CreateObject("ADODB.Connection")

conn.Open "Provider=SQLOLEDB; Data Source = ETSS704SQL1\MSSQLSERVER; Initial Catalog = GMIPROD; User Id = webapp; Password=!web@pp"

If conn.errors.count = 0 Then

Response.Write "Connected OK"

End If




</body>
</html>