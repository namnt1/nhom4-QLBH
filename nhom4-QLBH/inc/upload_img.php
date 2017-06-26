<?php
class upload_img extends WP_Widget {
	function __construct() {
		parent::__construct(
			'upload_img', 
			__( 'upload_img', 'text_domain' ), // Name
			array( 'description' => __( 'sản phẩm theo xu hướng', 'text_domain' ), )
		);
	}
	public function widget( $args, $instance ) {
		$args = array( 'post_type' => 'product', 'posts_per_page' => 1, 'product_cat' => $instance['cat'], 'orderby' => 'DESC' );
		$loop = new WP_Query( $args );
		while ( $loop->have_posts() ) : $loop->the_post(); global $product; ?>
		<div class="col-md-6 col-md">
			<div class="col-1">
			 <a href="<?php the_permalink(); ?>" class="b-link-stroke b-animate-go  thickbox">
				<img src="<?php echo $instance['image_uri']; ?>" class="img-responsive" alt=""/>
				<div class="b-wrapper1 long-img">
					<p class="b-animate b-from-right b-delay03 "><?php echo $instance['logo'] ?></p>
					<label class="b-animate b-from-right b-delay03 "></label>
					<h3 class="b-animate b-from-left b-delay03 "><?php echo $instance['sologan'] ?></h3></div></a>
			</div>
			<div class="col-2">
				<span><?php echo $instance['title'] ?></span>
				<h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
				<p><?php the_excerpt() ;?></p>
				<?php echo apply_filters( 'woocommerce_loop_add_to_cart_link',
				sprintf( '<a href="%s" rel="nofollow" data-product_id="%s" data-product_sku="%s" class="buy-now button %s
				product_type_%s buynow">Mua hàng</a>',
				esc_url( $product->add_to_cart_url() ),
				esc_attr( $product->id ),
				esc_attr( $product->get_sku() ),
				$product->is_purchasable() ? 'add_to_cart_button' : '',
				esc_attr( $product->product_type ),
				esc_html( $product->add_to_cart_text() )
				),
				$product ); ?>
			</div>
		</div>
		<?php endwhile; ?>
		<?php wp_reset_query(); ?>
		<?php
	
	}

	function ctUp_ads() {
	    $widget_ops = array( 'classname' => 'ctUp-ads' );
	    $control_ops = array( 'width' => 250, 'height' => 350, 'id_base' => 'ctUp-ads-widget' );
	    $this->WP_Widget( 'ctUp-ads-widget','EOTW', $widget_ops, $control_ops );
	}

	public function form( $instance ) {
		$title = ! empty( $instance['title'] ) ? $instance['title'] : __( 'New title', 'text_domain' );
		$logo = ! empty( $instance['logo'] ) ? $instance['logo'] : __( ' logo text', 'text_domain' );
		$sologan = ! empty( $instance['sologan'] ) ? $instance['sologan'] : __( 'New sologan', 'text_domain' );
		$cat = ! empty( $instance['cat'] ) ? $instance['cat'] : __( '1', 'text_domain' );
		?>
		<p>
			<label for="<?php echo esc_attr( $this->get_field_id( 'title' ) ); ?>"><?php _e( esc_attr( 'Title:' ) ); ?></label> 
			<input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'title' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>
		<p>
		<p>
			<label for="<?php echo esc_attr( $this->get_field_id( 'logo' ) ); ?>"><?php _e( esc_attr( 'logo:' ) ); ?></label> 
			<input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'title' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'logo' ) ); ?>" type="text" value="<?php echo esc_attr( $logo ); ?>">
		</p>
		<p>
		<p>
			<label for="<?php echo esc_attr( $this->get_field_id( 'sologan' ) ); ?>"><?php _e( esc_attr( 'Title:' ) ); ?></label> 
			<input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'sologan' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'sologan' ) ); ?>" type="text" value="<?php echo esc_attr( $sologan ); ?>">
		</p>
		<p>
		<label for="<?php echo esc_attr( $this->get_field_id( 'cat' ) ); ?>"><?php _e( esc_attr( 'Chọn danh mục sản phẩm' ) ); ?></label> 
			<select name="<?php echo esc_attr( $this->get_field_name('cat') ); ?>" id="<?php echo esc_attr( $this->		  get_field_id('cat') ); ?>">
			<option value=''><?php _e('Default'); ?></option>
			<?php

			$product_cats = get_terms("product_cat", "hide_empty=0");
			$default ='';
			
			 if ( !empty( $product_cats ) && !is_wp_error( $product_cats ) ){

				if(isset($cat )){
					$default = $cat ;					
				}
				//echo $default.'lamvt';
				foreach ($product_cats as $cat )
				: if ( $default == $cat->slug )
				  $selected = " selected='selected'";
				else
				  $selected = '';
			  echo "\n\t<option value='".$cat->slug."' $selected>$cat->name</option>";
			  //print_r($cat);
			  endforeach;
			 }
			?>
		</select>
			</p>
    	<p>
		<p>
		  <label for="<?php echo $this->get_field_id('image_uri'); ?>">Image</label><br />
		    <img class="custom_media_image" src="<?php if(!empty($instance['image_uri'])){echo $instance['image_uri'];} ?>" style="margin:0;padding:0;max-width:100px;float:left;display:inline-block" />
		    <input type="text" class="widefat custom_media_url" name="<?php echo $this->get_field_name('image_uri'); ?>" id="<?php echo $this->get_field_id('image_uri'); ?>" value="<?php echo $instance['image_uri']; ?>">
		    <input type="button" value="<?php _e( 'Upload Image', 'themename' ); ?>" class="button custom_media_upload" id="custom_image_uploader"/>
		</p>
		<?php 
	}
		
	public function update( $new_instance, $old_instance ) {
		$instance = array();
		$instance['title'] = ( ! empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
		$instance['logo'] = ( ! empty( $new_instance['logo'] ) ) ? strip_tags( $new_instance['logo'] ) : '';
		$instance['sologan'] = ( ! empty( $new_instance['sologan'] ) ) ? strip_tags( $new_instance['sologan'] ) : '';

		$instance['cat'] = ( ! empty( $new_instance['cat'] ) ) ? strip_tags( $new_instance['cat'] ) : '';
		 $instance['image_uri'] = strip_tags( $new_instance['image_uri'] );

		return $instance;
	}

} 
function ctUp_wdScript(){
	wp_enqueue_media();
	wp_enqueue_script('adsScript', get_template_directory_uri() . '/js/ads.js');
 }
add_action('admin_enqueue_scripts', 'ctUp_wdScript');
function register_upload_img() {
     register_widget( 'upload_img' );
 }
add_action( 'widgets_init', 'register_upload_img' );
?>
