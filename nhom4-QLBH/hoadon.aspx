<%@ Page Title="Hóa đơn" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >
    <div class="featured">
    <div class="container">
        <div class="row">
            <div class="feature-grids">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id_hd" DataSourceID="SqlDataSource2">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" Width="20%" Height="40px" />
            <Fields>
                <asp:BoundField DataField="id_hd" HeaderText="id_hd" ReadOnly="True" SortExpression="id_hd" />
                <asp:BoundField DataField="gia_tien" HeaderText="gia_tien" SortExpression="gia_tien" />
                <asp:BoundField DataField="id_kh" HeaderText="id_kh" SortExpression="id_kh" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [hoa_don] WHERE [id_hd] = @id_hd" InsertCommand="INSERT INTO [hoa_don] ([id_hd], [gia_tien], [id_kh]) VALUES (@id_hd, @gia_tien, @id_kh)" SelectCommand="SELECT [id_hd], [gia_tien], [id_kh] FROM [hoa_don]" UpdateCommand="UPDATE [hoa_don] SET [gia_tien] = @gia_tien, [id_kh] = @id_kh WHERE [id_hd] = @id_hd">
                    <DeleteParameters>
                        <asp:Parameter Name="id_hd" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_hd" Type="Int32" />
                        <asp:Parameter Name="gia_tien" Type="String" />
                        <asp:Parameter Name="id_kh" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="gia_tien" Type="String" />
                        <asp:Parameter Name="id_kh" Type="Int32" />
                        <asp:Parameter Name="id_hd" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [hoa_don] WHERE [id_hd] = @original_id_hd AND [gia_tien] = @original_gia_tien AND [id_kh] = @original_id_kh" InsertCommand="INSERT INTO [hoa_don] ([id_hd], [gia_tien], [id_kh]) VALUES (@id_hd, @gia_tien, @id_kh)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_hd], [gia_tien], [id_kh] FROM [hoa_don]" UpdateCommand="UPDATE [hoa_don] SET [gia_tien] = @gia_tien, [id_kh] = @id_kh WHERE [id_hd] = @original_id_hd AND [gia_tien] = @original_gia_tien AND [id_kh] = @original_id_kh">
            <DeleteParameters>
                <asp:Parameter Name="original_id_hd" Type="Int32" />
                <asp:Parameter Name="original_gia_tien" Type="String" />
                <asp:Parameter Name="original_id_kh" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_hd" Type="Int32" />
                <asp:Parameter Name="gia_tien" Type="String" />
                <asp:Parameter Name="id_kh" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="gia_tien" Type="String" />
                <asp:Parameter Name="id_kh" Type="Int32" />
                <asp:Parameter Name="original_id_hd" Type="Int32" />
                <asp:Parameter Name="original_gia_tien" Type="String" />
                <asp:Parameter Name="original_id_kh" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
            </div>
        </div>
    </div>
</asp:Content>
