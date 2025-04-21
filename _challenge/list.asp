<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual = "/adovbs.inc" -->
<!-- #include virtual = "/loop.asp" -->

<!doctype html public "-//w3c//dtd html 3.2//en">

<html>

<head>
<title></title>
</head>

<body>
<%
Dim conn,R,SQL,RecsAffected

Set conn=Server.CreateObject("ADODB.Connection")
conn.Mode=adModeReadWrite
conn.ConnectionString = aConnectionString
conn.Open