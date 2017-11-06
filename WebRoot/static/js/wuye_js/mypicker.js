(function($, doc) {
	$.init();
	$.ready(function() {
		//选择小区
		var villagePicker = new $.PopPicker({
			layer: 1
		});
		villagePicker.setData(village1);
		var showVillagePickerButton = doc.getElementById('showVillagePicker');
		var villageResult = doc.getElementById('villageResult');
		showVillagePickerButton.addEventListener('tap', function(event) {
			villagePicker.show(function(items) {
				villageResult.innerText = (items[0]).text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);

		//选择楼栋
		var buildingPicker = new $.PopPicker({
			layer: 1
		});
		buildingPicker.setData(building);
		var showBuildingPickerButton = doc.getElementById('showBuildingPicker');
		var buildingResult = doc.getElementById('buildingResult');
		showBuildingPickerButton.addEventListener('tap', function(event) {
			buildingPicker.show(function(items) {
				buildingResult.innerText = (items[0]).text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
		//选择门牌号
		var houseNumPicker = new $.PopPicker({
			layer: 1
		});
		houseNumPicker.setData(houseNum);
		var showHouseNumPickerButton = doc.getElementById('showHouseNumPicker');
		var houseNumResult = doc.getElementById('houseNumResult');
		showHouseNumPickerButton.addEventListener('tap', function(event) {
			houseNumPicker.show(function(items) {
				houseNumResult.innerText = (items[0]).text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);

		//-----------------------------------------
		//	选择地址	//级联
		var cityPicker = new $.PopPicker({
			layer: 3
		});
		cityPicker.setData(cityData);
		var showCityPickerButton = doc.getElementById('showCityPicker');
		var cityResult = doc.getElementById('addressResult');
		showCityPickerButton.addEventListener('tap', function(event) {
			cityPicker.show(function(items) {
				cityResult.innerText = (items[0] || {}).text + " " + (items[1] || {}).text + " " + (items[2] || {}).text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
	});
})(mui, document);