package com.digimate.marketmate;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.os.Bundle;
import android.view.Window;
import android.widget.ListView;

import com.digimate.marketmate.adapter.ProductListAdapter;
import com.digimate.marketmate.data.Product;

public class ActivityList extends Activity{
	
	private ListView listviewProduct;
	private List<Product> productList;
	private ProductListAdapter adapter;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.list_page);
		
		listviewProduct = (ListView) findViewById(R.id.lv_listpage);
		productList = new ArrayList<Product>();
		adapter = new ProductListAdapter(ActivityList.this, R.layout.list_item, productList);
		listviewProduct.setAdapter(adapter);

		getProducts();
	}
	private void getProducts(){
		int num = 10;
		for (int i = 0; i < num; i++){
			Product product = new Product("Product " + i, "Owner " + i, "Good", 100, 100, 100, "");
			productList.add(product);
		}
		
		adapter.notifyDataSetChanged();
	}
}
