Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub InvokeWcf_Click(sender As Object, e As EventArgs)

        Dim client As Service1Client = New Service1Client()
        Dim input As String = txtNumber.Text
        Dim inputValue As Int32
        Int32.TryParse(input, inputValue)
        Dim response As String = client.GetData(inputValue)
        lblInvokeWcfResponse.Text = response

    End Sub
End Class