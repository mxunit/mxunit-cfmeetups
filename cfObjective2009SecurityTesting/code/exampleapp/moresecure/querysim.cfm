
<!--------------------------------------------------------------------
Original QuerySim.cfm by hal.helms@TeamAllaire.com
Update by bill s. - 04.09.2009

This will only work in ColdFusion 8 and later due to conditional
syntax usage - && in lieu of AND, and i++, etc.

This decouples string parsing logic into a somewhat testable function.
For some reason, the orginal was throwing a list parsing exception on
what appeared to be normal text. So, it was dissasembled and i decided
to use java's String.split(regex) instead.

Note, one possibly major omission from the original is the lack of
reading querysim info from a profile file; ie, .ini. This was omitted
because 'i' don't use that.
--------------------------------------------------------------------->

<cfsetting enablecfoutputonly="yes">
<cfscript>
 local.queryName = '';
 local.raw = '';
 local.q = chr(0);

 if (thistag.HasEndTag and thistag.ExecutionMode is 'start'){
	//no worries
 }

 else if (thistag.HasEndTag and thistag.ExecutionMode is 'end'){
   local.raw = trim( Thistag.generatedContent );
	 thistag.generatedContent = '';
   local.q = parse(local.raw);
   setVariable( 'caller.' & local.queryName, local.q );
 }


function parse(input){
   var s = trim(input);
   var lines = s.split('\n');
   var line = '';
   var i = 1;
   var j = 1;
   var columnListLine = -1;
   var queryName = '';
   var columnList = '';
   var q = '';
   var row = '';

  for(i; i <=  arrayLen(lines); i ++ ){
     line = lines[i];

     if(line != '' && queryName == '') {
         queryName = lines[i];
         setQueryName(queryName);
         columnListLine = i+1;
         continue;
     }

     if(i == columnListLine) {
       columnList = lines[i];
       q = queryNew(columnList);
       continue;
     }

     if(line != ''){
      row = line.split("\|");
			queryAddRow(q);
			 for(j=1; j <= arrayLen(row); j++){
			   if(j <= listLen(columnList)) querySetCell(q, listGetAt(columnList,j) ,row[j]);
			  }
       continue;
     }

   }//end for()

   return q;
  } //end parse()


  function setQueryName(qName){
    local.queryName = qName;
  }

</cfscript>
<cfsetting enablecfoutputonly="No">