<?php

add_action( 'widgets_init', 'WooCommerce_widget_featured_products_Custom_widget' );

function WooCommerce_widget_featured_products_Custom_widget() {
	register_widget( 'WooCommerce_widget_featured_products_Custom' );
}

class WooCommerce_widget_featured_products_Custom extends WP_Widget {

	/** Variables to setup the widget. */
	var $woo_widget_cssclass;
	var $woo_widget_description;
	var $woo_widget_idbase;
	var $woo_widget_name;


	/**
	 * constructor
	 *
	 * @access public
	 * @return void
	 */
	function WooCommerce_widget_featured_products_Custom() {

		/* Widget variable settings. */
		$this->woo_widget_cssclass = 'widget_featured_products_custom';
		$this->woo_widget_description = __( 'hiển thị sản phẩm nổi bật.', 'woocommerce' );
		$this->woo_widget_idbase = 'woocommerce_featured_products';
		$this->woo_widget_name = __(' Featured Products', 'woocommerce' );

		/* Widget settings. */
		$widget_ops = array( 'classname' => $this->woo_widget_cssclass, 'description' => $this->woo_widget_description );

		/* Create the widget. */
		$this->WP_Widget('featured-products', $this->woo_widget_name, $widget_ops);

		add_action( 'save_post', array(&$this, 'flush_widget_cache') );
		add_action( 'deleted_post', array(&$this, 'flush_widget_cache') );
		add_action( 'switch_theme', array(&$this, 'flush_widget_cache') );
	}


	/**
	 * widget function.
	 *
	 * @see WP_Widget
	 * @access public
	 * @param array $args
	 * @param array $instance
	 * @return void
	 */
	function widget($args, $instance) {
		global $woocommerce;

		$cache = wp_cache_get('widget_featured_products_custom', 'widget');

		if ( !is_array($cache) ) $cache = array();

		if ( isset($cache[$args['widget_id']]) ) {
			echo $cache[$args['widget_id']];
			return;
		}

		ob_start();
		extract($args);
		?>
		<div class="content-mid">
			<h3><?php echo $instance['title']; ?></h3>
			<label class="line"></label>
			
			<div class="mid-popular">	
		<?php
		$cat_slug_lamvt =  trim($instance['cat_slug_lamvt']);
		//echo $cat_slug_lamvt;
		if ( !$number = (int) $instance['number'] )
			$number = 10;
		else if ( $number < 1 )
			$number = 1;
		else if ( $number > 15 )
			$number = 15;
		if($cat_slug_lamvt=='clothing'){
			$query_args = array('posts_per_page' => $instance['number'], 'no_found_rows' => 1, 'post_status' => 'publish', 'post_type' => 'product' );
						
			$query_args['meta_query'] = array();

			$query_args['meta_query'][] = array(
				'key' => '_featured',
				'value' => 'yes'
			);
			$query_args['meta_query'][] = $woocommerce->query->stock_status_meta_query();
			$query_args['meta_query'][] = $woocommerce->query->visibility_meta_query();
		}else{
			$query_args = array('posts_per_page' => $instance['number'], 'no_found_rows' => 1, 'post_status' => 'publish', 'post_type' => 'product','product_cat' => $cat_slug_lamvt );
			$query_args['meta_query'] = array();

			$query_args['meta_query'][] = array(
				'key' => '_featured',
				'value' => 'yes'
			);
			$query_args['meta_query'][] = $woocommerce->query->stock_status_meta_query();
			$query_args['meta_query'][] = $woocommerce->query->visibility_meta_query();
		}
		$a = bloginfo('stylesheet_directory');
						
		$r = new WP_Query($query_args);

		if ($r->have_posts()) : ?>
		<?php echo $before_widget; ?>		
		<?php 
		$i=0;
		while ($r->have_posts()) : $r->the_post(); global $product; 
			if ( has_post_thumbnail() ){
				$image = wp_get_attachment_image_src(get_post_thumbnail_id(get_the_ID()), apply_filters( 'single_product_large_thumbnail_size', 'shop_single' ));
				$image = $image[0];}		
		?>
		<div class="col-md-3 item-grid simpleCart_shelfItem">
			<div class=" mid-pop">
				<div class="pro-img">
					<img class="img-responsive" src="<?php echo $image ; ?>" alt="<?php the_title(); ?>" />
					<div class="zoom-icon ">
						<a class="picture" href="<?php echo $image ; ?>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<?php the_permalink(); ?>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
					</div>
				</div>
				<div class="mid-1">
					<div class="women">
						<div class="women-top">
							<span> <?php
						
$term = get_terms('product_cat', 'orderby=term_id');
 ?><a href="<?php get_permalink($post->ID); ?>"><?php echo $term->term_id ?></a>	</span>
							<h6><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h6>
						</div>
						<div class="img item_add">
							<?php echo apply_filters( 'woocommerce_loop_add_to_cart_link',
							sprintf( '<a href="%s" rel="nofollow" data-product_id="%s" data-product_sku="%s" class="add-cart button %s
							product_type_%s buynow"><img src=" http://127.0.0.1:81/Eshopper/wp-content/themes/shopin/images/ca.png"/></a>',
							esc_url( $product->add_to_cart_url() ),
							esc_attr( $product->id ),
							esc_attr( $product->get_sku() ),
							$product->is_purchasable() ? 'add_to_cart_button' : '',
							esc_attr( $product->product_type ),
							esc_html( $product->add_to_cart_text() )
							),
							$product ); ?>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="mid-2">
						<p><label><?php echo get_post_meta( get_the_ID(), '_sale_price', true ); ?></label><em class="item_price"><?php echo get_post_meta( get_the_ID(), '_regular_price', true ); ?></em></p>
						  <div class="block">
							<div class="starbox small ghosting">ádsa </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php endwhile; ?>
		<?php echo $after_widget; ?>
		<?php endif;
		?>

			<div class="clearfix"></div>
		</div>
	</div>
		<?php
		$content = ob_get_clean();
		if ( isset( $args['widget_id'] ) ) $cache[$args['widget_id']] = $content;
		echo $content;
		wp_cache_set('widget_featured_products_custom', $cache, 'widget');
        wp_reset_postdata();
	}


	/**
	 * update function.
	 *
	 * @see WP_Widget->update
	 * @access public
	 * @param array $new_instance
	 * @param array $old_instance
	 * @return array
	 */
	function update( $new_instance, $old_instance ) {
		$instance = $old_instance;
		$instance['title'] = strip_tags($new_instance['title']);
		$instance['cat_slug_lamvt'] = strip_tags($new_instance['cat_slug_lamvt']);
		$instance['number'] = (int) $new_instance['number'];
		$this->flush_widget_cache();
		return $instance;
	}


	/**
	 * flush_widget_cache function.
	 *
	 * @access public
	 * @return void
	 */
	function flush_widget_cache() {
		wp_cache_delete('widget_featured_products_custom', 'widget');
	}


	/**
	 * form function.
	 *
	 * @see WP_Widget->form
	 * @access public
	 * @param array $instance
	 * @return void
	 */
	function form( $instance ) {
		$title = isset($instance['title']) ? esc_attr($instance['title']) : '';
		$cat_slug_lamvt = isset($instance['cat_slug_lamvt']) ? esc_attr($instance['cat_slug_lamvt']) : '';
		if ( !isset($instance['number']) || !$number = (int) $instance['number'] )
			$number = 2;
?>
		<p><label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title:', 'woocommerce'); ?></label>
		<input class="widefat" id="<?php echo esc_attr( $this->get_field_id('title') ); ?>" name="<?php echo esc_attr( $this->get_field_name('title') ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>" /></p>
<p><label for="<?php echo $this->get_field_id('number'); ?>"><?php _e('Number of products to show:', 'woocommerce'); ?></label>
		<input id="<?php echo esc_attr( $this->get_field_id('number') ); ?>" name="<?php echo esc_attr( $this->get_field_name('number') ); ?>" type="text" value="<?php echo esc_attr( $number ); ?>" size="3" /></p>
<?php
	}
}