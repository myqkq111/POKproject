function writeSave(){

	if(writeform.writer.value==""){
	  alert("�ۼ��ڸ� �Է��Ͻʽÿ�.");
	  writeform.writer.focus();
	  return false;
	}
	if(writeform.subject.value==""){
	  alert("������ �Է��Ͻʽÿ�.");
	  writeform.subject.focus();
	  return false;
	}
	
	if(writeform.content.value==""){
	  alert("������ �Է��Ͻʽÿ�.");
	  writeform.content.focus();
	  return false;
	}
        
	if(writeform.passwd.value==""){
	  alert(" ��й�ȣ�� �Է��Ͻʽÿ�.");
	  writeform.passwd.focus();
	  return false;
	}
 }    