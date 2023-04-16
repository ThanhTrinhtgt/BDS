<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Core\SimpleXLSX;

class TestController extends BaseController
{
	public function index()
	{
		$path = dirname(__DIR__).'\User\Export_PA_TruyenNhan_1681611137.xlsx';
		if ( $xlsx = SimpleXLSX::parse($path) ) {
		    $excel = $xlsx->rows();
		    $result = [];


		    foreach ($excel as $k => $data) {
		    	if ($k == 0) {
		    		continue;
		    	}
		    	//pr($data, true);
		    	$MaTD = $data[8];
		    	$maCQT = $data[4];
		    	$mst = $data[5];
		    	$shd = (int)$data[2];

		    	if (!in_array($mst, [3703070172, 1801699920, 3703053314])) {
		    		//echo "update invoices set code='$MaTD', code_cqt='$maCQT', status=3  WHERE no='$shd' and status =1 and created_at >= '2023-04-16 00:00:00';<br/>";
		    		echo "update invoices set code='$MaTD', status=2 WHERE no='$shd' and status =1 and created_at >= '2023-04-16 00:00:00';<br/>";
		    	}

		    	/*


$('.tvan-list-report tbody > tr').each((k, item) => {
    let $tr = $(item);
    let shd  = $tr.find('>td')[2].innerHTML.replace(/\s/ig, '');
    let mst  = $tr.find('>td')[5].innerHTML.replace(/\s/ig, '');
    let macqt  = $tr.find('>td')[4].innerHTML.replace(/\s/ig, '');
    let matd  = $tr.find('>td')[8].innerHTML.replace(/\s/ig, '');

    if (mst != 3703070172 && mst != 1801699920 && mst != 3703053314) {
        console.log("update invoices set code='"+matd+"', code_cqt='"+macqt+"', status=3  WHERE no='"+shd+"' and status =1 and created_at >= '2023-04-16 00:00:00';");        
    }

})
		    	*/

		    }
exit;
		   	//print_r(implode(";\n", $result));
		} else {
		    echo SimpleXLSX::parseError();
		}


		/*pr(dirname(__DIR__).'\User\Export_PA_TruyenNhan_1681611137.xlsx', true);
		$f = fopen(dirname(__DIR__).'\User\Export_PA_TruyenNhan_1681611137.xlsx', 'r');
		pr($f);*/
	}
}