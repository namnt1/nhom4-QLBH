<%@ Page Title="Trang Chủ" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >

<div class="featured">
    <div class="container">
        <div class="content">
			<div class="container">
				
				<!--products-->
			<div class="content-mid">
				<h3 style="font-family:Arial;">Sản phẩm</h3>
				<label class="line"></label>
				<div class="mid-popular">
					
					</div>
					</div>
					<div class="clearfix"></div>
				</div>
        <div class="row">
            <div class="feature-grids">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
			             <div class="col-md-3 feature-grid jewel">
				             <asp:Image id="Image2" runat="server"
                                        CssClass ="img-rounded"
                                        Width="100%"
                                        Height="230px"
                                        AlternateText="Image text"
                                        ImageAlign="left"
                                        ImageUrl="<%# Bind('anh')%>"
                                        />
					             <div class="arrival-info">
						             <h4><a href="#" class="text-muted"><asp:Label ID="Label1" runat="server" Text='<%# Bind("ten_sp") %>' /></a></h4>
						             <p><asp:Label ID="Label2" runat="server" Text='<%# Bind("gia_thanh")%>' /> VNĐ</b></p>  
					             </div>
					             </a><div class="viw"><a href="product.html">
                                     <asp:HyperLink id="hyperlink2" NavigateUrl="sanpham.aspx" Text="Sửa" runat="server"/>
					             </div>
			             </div>
                </ItemTemplate>
            </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [ten_sp], [gia_thanh], [anh] FROM [san_pham]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [san_pham]" OldValuesParameterFormatString="original_{0}">
            </asp:SqlDataSource>
            </div>
        </div>
        </div>
    </div>
</asp:Content>
