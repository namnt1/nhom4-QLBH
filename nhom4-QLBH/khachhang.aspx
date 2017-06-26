<%@ Page Title="Khách hàng" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >
    <div class="featured">
    <div class="container">
        <div class="row">
            <div class="feature-grids">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id_kh" DataSourceID="SqlDataSource2">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" Width="20%" Height="40px" />
            <Fields>
                <asp:BoundField DataField="id_kh" HeaderText="id_kh" ReadOnly="True" SortExpression="id_kh" />
                <asp:BoundField DataField="ten" HeaderText="ten" SortExpression="ten" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="dia_chi" HeaderText="dia_chi" SortExpression="dia_chi" />
                <asp:BoundField DataField="sdt" HeaderText="sdt" SortExpression="sdt" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [khach_hang] WHERE [id_kh] = @id_kh" InsertCommand="INSERT INTO [khach_hang] ([id_kh], [ten], [email], [dia_chi], [sdt]) VALUES (@id_kh, @ten, @email, @dia_chi, @sdt)" SelectCommand="SELECT [id_kh], [ten], [email], [dia_chi], [sdt] FROM [khach_hang]" UpdateCommand="UPDATE [khach_hang] SET [ten] = @ten, [email] = @email, [dia_chi] = @dia_chi, [sdt] = @sdt WHERE [id_kh] = @id_kh">
                    <DeleteParameters>
                        <asp:Parameter Name="id_kh" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_kh" Type="Int32" />
                        <asp:Parameter Name="ten" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="dia_chi" Type="String" />
                        <asp:Parameter Name="sdt" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ten" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="dia_chi" Type="String" />
                        <asp:Parameter Name="sdt" Type="Int32" />
                        <asp:Parameter Name="id_kh" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [khach_hang] WHERE [id_kh] = @original_id_kh AND [ten] = @original_ten AND [email] = @original_email AND [dia_chi] = @original_dia_chi AND [sdt] = @original_sdt" InsertCommand="INSERT INTO [khach_hang] ([id_kh], [ten], [email], [dia_chi], [sdt]) VALUES (@id_kh, @ten, @email, @dia_chi, @sdt)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_kh], [ten], [email], [dia_chi], [sdt] FROM [khach_hang]" UpdateCommand="UPDATE [khach_hang] SET [ten] = @ten, [email] = @email, [dia_chi] = @dia_chi, [sdt] = @sdt WHERE [id_kh] = @original_id_kh AND [ten] = @original_ten AND [email] = @original_email AND [dia_chi] = @original_dia_chi AND [sdt] = @original_sdt">
            <DeleteParameters>
                <asp:Parameter Name="original_id_kh" Type="Int32" />
                <asp:Parameter Name="original_ten" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_dia_chi" Type="String" />
                <asp:Parameter Name="original_sdt" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_kh" Type="Int32" />
                <asp:Parameter Name="ten" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="dia_chi" Type="String" />
                <asp:Parameter Name="sdt" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ten" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="dia_chi" Type="String" />
                <asp:Parameter Name="sdt" Type="Int32" />
                <asp:Parameter Name="original_id_kh" Type="Int32" />
                <asp:Parameter Name="original_ten" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_dia_chi" Type="String" />
                <asp:Parameter Name="original_sdt" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
            </div>
        </div>
    </div>
</asp:Content>
