
<%@ Page Title="Sản phẩm" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >
    <div class="featured">
    <div class="container">
        <div class="row">
            <div class="feature-grids">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id_sp" DataSourceID="SqlDataSource2">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" Width="20%" Height="40px"  />
            <Fields>
                <asp:BoundField DataField="id_sp" HeaderText="id_sp" ReadOnly="True" SortExpression="id_sp" />
                <asp:BoundField DataField="id_lsp" HeaderText="id_lsp" SortExpression="id_lsp" />
                <asp:BoundField DataField="ma_sp" HeaderText="ma_sp" SortExpression="ma_sp" />
                <asp:BoundField DataField="ten_sp" HeaderText="ten_sp" SortExpression="ten_sp" />
                <asp:BoundField DataField="gia_thanh" HeaderText="gia_thanh" SortExpression="gia_thanh" />
                <asp:BoundField DataField="mo_ta" HeaderText="mo_ta" SortExpression="mo_ta" />
                <asp:BoundField DataField="anh" HeaderText="anh" SortExpression="anh" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [san_pham] WHERE [id_sp] = @id_sp" InsertCommand="INSERT INTO [san_pham] ([id_sp], [id_lsp], [ma_sp], [ten_sp], [gia_thanh], [mo_ta], [anh]) VALUES (@id_sp, @id_lsp, @ma_sp, @ten_sp, @gia_thanh, @mo_ta, @anh)" SelectCommand="SELECT [id_sp], [id_lsp], [ma_sp], [ten_sp], [gia_thanh], [mo_ta], [anh] FROM [san_pham]" UpdateCommand="UPDATE [san_pham] SET [id_lsp] = @id_lsp, [ma_sp] = @ma_sp, [ten_sp] = @ten_sp, [gia_thanh] = @gia_thanh, [mo_ta] = @mo_ta, [anh] = @anh WHERE [id_sp] = @id_sp">
                    <DeleteParameters>
                        <asp:Parameter Name="id_sp" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_sp" Type="Int32" />
                        <asp:Parameter Name="id_lsp" Type="Int32" />
                        <asp:Parameter Name="ma_sp" Type="String" />
                        <asp:Parameter Name="ten_sp" Type="String" />
                        <asp:Parameter Name="gia_thanh" Type="Decimal" />
                        <asp:Parameter Name="mo_ta" Type="String" />
                        <asp:Parameter Name="anh" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_lsp" Type="Int32" />
                        <asp:Parameter Name="ma_sp" Type="String" />
                        <asp:Parameter Name="ten_sp" Type="String" />
                        <asp:Parameter Name="gia_thanh" Type="Decimal" />
                        <asp:Parameter Name="mo_ta" Type="String" />
                        <asp:Parameter Name="anh" Type="String" />
                        <asp:Parameter Name="id_sp" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [san_pham] WHERE [id_sp] = @original_id_sp AND [id_lsp] = @original_id_lsp AND [ma_sp] = @original_ma_sp AND [ten_sp] = @original_ten_sp AND [gia_thanh] = @original_gia_thanh AND [mo_ta] = @original_mo_ta AND [anh] = @original_anh" InsertCommand="INSERT INTO [san_pham] ([id_sp], [id_lsp], [ma_sp], [ten_sp], [gia_thanh], [mo_ta], [anh]) VALUES (@id_sp, @id_lsp, @ma_sp, @ten_sp, @gia_thanh, @mo_ta, @anh)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_sp], [id_lsp], [ma_sp], [ten_sp], [gia_thanh], [mo_ta], [anh] FROM [san_pham]" UpdateCommand="UPDATE [san_pham] SET [id_lsp] = @id_lsp, [ma_sp] = @ma_sp, [ten_sp] = @ten_sp, [gia_thanh] = @gia_thanh, [mo_ta] = @mo_ta, [anh] = @anh WHERE [id_sp] = @original_id_sp AND [id_lsp] = @original_id_lsp AND [ma_sp] = @original_ma_sp AND [ten_sp] = @original_ten_sp AND [gia_thanh] = @original_gia_thanh AND [mo_ta] = @original_mo_ta AND [anh] = @original_anh">
            <DeleteParameters>
                <asp:Parameter Name="original_id_sp" Type="Int32" />
                <asp:Parameter Name="original_id_lsp" Type="Int32" />
                <asp:Parameter Name="original_ma_sp" Type="String" />
                <asp:Parameter Name="original_ten_sp" Type="String" />
                <asp:Parameter Name="original_gia_thanh" Type="Decimal" />
                <asp:Parameter Name="original_mo_ta" Type="String" />
                <asp:Parameter Name="original_anh" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_sp" Type="Int32" />
                <asp:Parameter Name="id_lsp" Type="Int32" />
                <asp:Parameter Name="ma_sp" Type="String" />
                <asp:Parameter Name="ten_sp" Type="String" />
                <asp:Parameter Name="gia_thanh" Type="Decimal" />
                <asp:Parameter Name="mo_ta" Type="String" />
                <asp:Parameter Name="anh" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_lsp" Type="Int32" />
                <asp:Parameter Name="ma_sp" Type="String" />
                <asp:Parameter Name="ten_sp" Type="String" />
                <asp:Parameter Name="gia_thanh" Type="Decimal" />
                <asp:Parameter Name="mo_ta" Type="String" />
                <asp:Parameter Name="anh" Type="String" />
                <asp:Parameter Name="original_id_sp" Type="Int32" />
                <asp:Parameter Name="original_id_lsp" Type="Int32" />
                <asp:Parameter Name="original_ma_sp" Type="String" />
                <asp:Parameter Name="original_ten_sp" Type="String" />
                <asp:Parameter Name="original_gia_thanh" Type="Decimal" />
                <asp:Parameter Name="original_mo_ta" Type="String" />
                <asp:Parameter Name="original_anh" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</div>
  </div>
    </div>
</asp:Content>