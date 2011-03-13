component  persistent="true" accessors="true"{
	property name="id" fieldtype="id" generator="native";
	property name="administratorName";
	property name="firstName";
	property name="lastName";
	property name="ModifiedBy";

	property name="administeredEvents" fieldtype="one-to-many" fkcolumn="ModifiedBy" cfc="Event";

}