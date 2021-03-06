component  persistent="true" accessors="true"{
	property name="id" fieldtype="id" generator="native";
	property name="eventName";
	property name="eventDate";
	property name="isActive";

	property name="ModifiedBy" fieldtype="many-to-one" fkcolumn="ModifiedBy" cfc="Administrator";

	property name="eventComments" fieldtype="one-to-many" cfc="EventComment"
		fkcolumn="EventID"
		singularname="eventComment"
		cascade="all-delete-orphan"
		inverse="true";
}
