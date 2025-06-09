<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">20.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Tests" Type="Folder">
			<Item Name="reqwest_tests.lvlib" Type="Library" URL="../Tests/reqwest_tests.lvlib"/>
		</Item>
		<Item Name="reqwest.lvlib" Type="Library" URL="../reqwest.lvlib"/>
		<Item Name="test_client.vi" Type="VI" URL="../test_client.vi"/>
		<Item Name="Example - Download with Progress and Abort (RUST).vi" Type="VI" URL="../Examples/Example - Download with Progress and Abort (RUST).vi"/>
		<Item Name="VIPM is Logged-In.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/VIPM is Logged-In.vi"/>
		<Item Name="update_specs_cache_archive.vi" Type="VI" URL="../../../vipm-desktop/build support/cache_archive/update_specs_cache_archive.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="openg_string.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/openg_string.lvlib"/>
				<Item Name="openg_variant.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/openg_variant.lvlib"/>
				<Item Name="openg_error.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/error/error.llb/openg_error.lvlib"/>
				<Item Name="openg_file.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/file/file.llb/openg_file.lvlib"/>
				<Item Name="openg_array.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/openg_array.lvlib"/>
				<Item Name="openg_application_control.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/appcontrol/appcontrol.llb/openg_application_control.lvlib"/>
				<Item Name="openg_comparison__ogtk.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/comparison/comparison.llb/openg_comparison__ogtk.lvlib"/>
				<Item Name="openg_time.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/time/time.llb/openg_time.lvlib"/>
				<Item Name="openg_variant_configuration_file.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/openg_variant_configuration_file.lvlib"/>
				<Item Name="ZLIB Open ZIP Mode__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Open ZIP Mode__ogtk.ctl"/>
				<Item Name="ZLIB File Info__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB File Info__ogtk.ctl"/>
				<Item Name="ZLIB Open Zip Archive__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Open Zip Archive__ogtk.vi"/>
				<Item Name="ZLIB Zip Handle__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Zip Handle__ogtk.ctl"/>
				<Item Name="ZLIB Close Zip Archive__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Close Zip Archive__ogtk.vi"/>
				<Item Name="ZLIB Store File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Store File__ogtk.vi"/>
				<Item Name="ZLIB Specific Path to Common Path__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Specific Path to Common Path__ogtk.vi"/>
				<Item Name="ZLIB Open Unzip Archive__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Open Unzip Archive__ogtk.vi"/>
				<Item Name="ZLIB Unzip Handle__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Unzip Handle__ogtk.ctl"/>
				<Item Name="ZLIB Close Unzip Archive__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Close Unzip Archive__ogtk.vi"/>
				<Item Name="ZLIB Enumerate File Contents__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Enumerate File Contents__ogtk.vi"/>
				<Item Name="ZLIB Extract Stream__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Extract Stream__ogtk.vi"/>
				<Item Name="ZLIB Copy Raw File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Copy Raw File__ogtk.vi"/>
				<Item Name="ZLIB Extract File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Extract File__ogtk.vi"/>
				<Item Name="Dictionary Create__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Create__ogtk.vi"/>
				<Item Name="Dictionary New__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary New__ogtk.vi"/>
				<Item Name="Dictionary Get Data to Modify__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Get Data to Modify__ogtk.vi"/>
				<Item Name="Dictionary Object Data Core Task Enum__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Object Data Core Task Enum__ogtk.ctl"/>
				<Item Name="Dictionary Get Instance Semaphore RefNum__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Get Instance Semaphore RefNum__ogtk.vi"/>
				<Item Name="Dictionary Object Ref Type__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Object Ref Type__ogtk.vi"/>
				<Item Name="Dictionary Object RefNum - Enum__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Object RefNum - Enum__ogtk.ctl"/>
				<Item Name="Dictionary Object RefNum__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Object RefNum__ogtk.ctl"/>
				<Item Name="Dictionary Data Core__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Data Core__ogtk.vi"/>
				<Item Name="Dictionary Object Data Store VI Ref Type__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Object Data Store VI Ref Type__ogtk.vi"/>
				<Item Name="Dictionary Object Data Store__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Object Data Store__ogtk.vi"/>
				<Item Name="Dictionary Default Data__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Default Data__ogtk.vi"/>
				<Item Name="Dictionary Data__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Data__ogtk.ctl"/>
				<Item Name="Dictionary Set Modified Data__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Set Modified Data__ogtk.vi"/>
				<Item Name="Dictionary Open Object Reference__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Open Object Reference__ogtk.vi"/>
				<Item Name="Dictionary Data Store VI Name__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Data Store VI Name__ogtk.vi"/>
				<Item Name="Dictionary Not a Dictionary__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Not a Dictionary__ogtk.vi"/>
				<Item Name="Dictionary Get Value__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Get Value__ogtk.vi"/>
				<Item Name="Dictionary Get Data__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Get Data__ogtk.vi"/>
				<Item Name="Dictionary Update (poly)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Update (poly)__ogtk.vi"/>
				<Item Name="Dictionary Update (by value)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Update (by value)__ogtk.vi"/>
				<Item Name="Dictionary Key Value Pair Cluster__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Key Value Pair Cluster__ogtk.ctl"/>
				<Item Name="Dictionary Update (by reference)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Update (by reference)__ogtk.vi"/>
				<Item Name="Dictionary Get Items__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Get Items__ogtk.vi"/>
				<Item Name="Dictionary Update (by scalar value)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Update (by scalar value)__ogtk.vi"/>
				<Item Name="Dictionary Get Values__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Get Values__ogtk.vi"/>
				<Item Name="Draw Image from File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/picture/picture.llb/Draw Image from File__ogtk.vi"/>
				<Item Name="ZLIB Inflate__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Inflate__ogtk.vi"/>
				<Item Name="Boolean Trigger__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/boolean/boolean.llb/Boolean Trigger__ogtk.vi"/>
				<Item Name="Random Number - Within Range__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/numeric/numeric.llb/Random Number - Within Range__ogtk.vi"/>
				<Item Name="ZLIB Move Raw File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Move Raw File__ogtk.vi"/>
				<Item Name="ZLIB Get Global Info__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Get Global Info__ogtk.vi"/>
				<Item Name="ZLIB Go To Next File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Go To Next File__ogtk.vi"/>
				<Item Name="ZLIB Go To First File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Go To First File__ogtk.vi"/>
				<Item Name="ZLIB Get Current File Info__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Get Current File Info__ogtk.vi"/>
				<Item Name="ZLIB Open Unzip__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Open Unzip__ogtk.vi"/>
				<Item Name="Dictionary Destroy__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Destroy__ogtk.vi"/>
				<Item Name="Dictionary Delete__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Delete__ogtk.vi"/>
				<Item Name="Dictionary Close Object Reference__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/dictionary/dictionary.llb/Dictionary Close Object Reference__ogtk.vi"/>
				<Item Name="ZLIB Store Stream__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Store Stream__ogtk.vi"/>
				<Item Name="ZLIB Locate File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Locate File__ogtk.vi"/>
				<Item Name="ZLIB Open Read File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Open Read File__ogtk.vi"/>
				<Item Name="ZLIB Close Read File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Close Read File__ogtk.vi"/>
				<Item Name="ZLIB Block Size__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Block Size__ogtk.vi"/>
				<Item Name="lvzlib.dll" Type="Document" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzlib.dll"/>
				<Item Name="MACBIN Decode MacBinary__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/macbin.llb/MACBIN Decode MacBinary__ogtk.vi"/>
				<Item Name="ZLIB Read Compressed File__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvzip/lvzip.llb/ZLIB Read Compressed File__ogtk.vi"/>
				<Item Name="MD5 Message Digest__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 Message Digest__ogtk.vi"/>
				<Item Name="MD5 Message Digest (Binary String)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 Message Digest (Binary String)__ogtk.vi"/>
				<Item Name="MD5 Padding__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 Padding__ogtk.vi"/>
				<Item Name="MD5 Unrecoverable character padding__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 Unrecoverable character padding__ogtk.vi"/>
				<Item Name="MD5 ti__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 ti__ogtk.vi"/>
				<Item Name="MD5 FGHI functions__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 FGHI functions__ogtk.vi"/>
				<Item Name="MD5 F function__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 F function__ogtk.vi"/>
				<Item Name="MD5 G function__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 G function__ogtk.vi"/>
				<Item Name="MD5 H function__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 H function__ogtk.vi"/>
				<Item Name="MD5 I function__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 I function__ogtk.vi"/>
				<Item Name="MD5 Message Digest (Hexadecimal String)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/md5/md5.llb/MD5 Message Digest (Hexadecimal String)__ogtk.vi"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="Get LV Class Default Value By Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value By Name.vi"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="LV70DateRecToTimeStamp.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/LV70DateRecToTimeStamp.vi"/>
				<Item Name="LVDateTimeRec.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVDateTimeRec.ctl"/>
				<Item Name="Qualified Name Array To Single String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Qualified Name Array To Single String.vi"/>
				<Item Name="Get File System Separator.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysinfo.llb/Get File System Separator.vi"/>
				<Item Name="Has LLB Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Has LLB Extension.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Get VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get VI Library File Info.vi"/>
				<Item Name="Librarian File Info Out.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info Out.ctl"/>
				<Item Name="Librarian.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian.vi"/>
				<Item Name="Librarian File Info In.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info In.ctl"/>
				<Item Name="Librarian File List.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File List.ctl"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="Librarian Get Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Get Info.vi"/>
				<Item Name="Librarian Path Location.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Path Location.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Is Path and Not Empty.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Is Path and Not Empty.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Librarian Set Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Set Info.vi"/>
				<Item Name="Set VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Set VI Library File Info.vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Caraya.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/Caraya.lvlib"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Local UTC Offset.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Local UTC Offset.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Timestamp to ISO8601 UTC DateTime.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Timestamp to ISO8601 UTC DateTime.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Build Error Cluster__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Build Error Cluster__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Last PString__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Last PString__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get PString__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get PString__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Header from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Header from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Variant to Header Info__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Variant to Header Info__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Variant Attributes__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Variant Attributes__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Set Data Name__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Set Data Name__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Data Name from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Data Name from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Data Name__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Data Name__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Array Size(s)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Array Size(s)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Reshape Array to 1D VArray__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Reshape Array to 1D VArray__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Array to Array of VData__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Array to Array of VData__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Parse String with TDs__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Parse String with TDs__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Split Cluster TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Split Cluster TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Cluster to Array of VData__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Cluster to Array of VData__ogtk.vi"/>
				<Item Name="TD_MDTFlavor.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/TD_MDTFlavor.ctl"/>
				<Item Name="Type Descriptor I16.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Type Descriptor I16.ctl"/>
				<Item Name="Type Descriptor I16 Array.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Type Descriptor I16 Array.ctl"/>
				<Item Name="TD_Get MDT Information.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/TD_Get MDT Information.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Unwrap VVariant__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Unwrap VVariant__ogtk.vi"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Strip Path Extension - String__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Strip Path Extension - String__ogtk.vi"/>
				<Item Name="TRef TravTarget.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef TravTarget.ctl"/>
				<Item Name="TRef Traverse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse.vi"/>
				<Item Name="VI Scripting - Traverse.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/traverseref.llb/VI Scripting - Traverse.lvlib"/>
				<Item Name="TRef Traverse for References.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse for References.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5File Exists - Scalar__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5File Exists - Scalar__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Sort 1D Array (I32)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Sort 1D Array (I32)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Build Path - File Names Array__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Build Path - File Names Array__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Trim Whitespace (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Trim Whitespace (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5List Directory__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5List Directory__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5List Directory Recursive__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5List Directory Recursive__ogtk.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="List Directory and LLBs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/List Directory and LLBs.vi"/>
				<Item Name="Recursive File List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Recursive File List.vi"/>
				<Item Name="Compare Two Paths.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Two Paths.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Resolve Timestamp Format__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Resolve Timestamp Format__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from Data__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Array Element TDEnum__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Array Element TDEnum__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Strip Units__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Strip Units__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from Data__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from Data__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Format Variant Into String__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Format Variant Into String__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Element TD from Array TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Element TD from Array TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units__ogtk.vi"/>
				<Item Name="Set Cursor (Icon Pict).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Icon Pict).vi"/>
				<Item Name="Set Cursor (Cursor ID).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Cursor ID).vi"/>
				<Item Name="Set Cursor.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor.vi"/>
				<Item Name="Set Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Busy.vi"/>
				<Item Name="Unset Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Unset Busy.vi"/>
				<Item Name="Open URL in Default Browser core.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser core.vi"/>
				<Item Name="Open URL in Default Browser (string).vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser (string).vi"/>
				<Item Name="Escape Characters for HTTP.vi" Type="VI" URL="/&lt;vilib&gt;/printing/PathToURL.llb/Escape Characters for HTTP.vi"/>
				<Item Name="Path to URL inner.vi" Type="VI" URL="/&lt;vilib&gt;/printing/PathToURL.llb/Path to URL inner.vi"/>
				<Item Name="Path to URL.vi" Type="VI" URL="/&lt;vilib&gt;/printing/PathToURL.llb/Path to URL.vi"/>
				<Item Name="Open URL in Default Browser (path).vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser (path).vi"/>
				<Item Name="Open URL in Default Browser.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Empty 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Empty 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (I32)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (I32)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (String)__ogtk.vi"/>
				<Item Name="Caraya Interactive Menu.rtm" Type="Document" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/menu/Caraya Interactive Menu.rtm"/>
				<Item Name="Dflt Data Dir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Dflt Data Dir.vi"/>
				<Item Name="Trim Whitespace One-Sided.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace One-Sided.vi"/>
				<Item Name="Add State(s) to Queue__JKI_lib_State_Machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Add State(s) to Queue__JKI_lib_State_Machine.vi"/>
				<Item Name="Parse State Queue__JKI_lib_State_Machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Parse State Queue__JKI_lib_State_Machine.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="NI_PtbyPt.lvlib" Type="Library" URL="/&lt;vilib&gt;/ptbypt/NI_PtbyPt.lvlib"/>
				<Item Name="LabVIEWHTTPClient.lvlib" Type="Library" URL="/&lt;vilib&gt;/httpClient/LabVIEWHTTPClient.lvlib"/>
				<Item Name="Path To Command Line String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Path To Command Line String.vi"/>
				<Item Name="JKI Serialization.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI.lib/Serialization/Core/JKI Serialization.lvlib"/>
				<Item Name="JKI JSON Serialization.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI.lib/Serialization/JSON/JKI JSON Serialization.lvlib"/>
				<Item Name="JKI Unicode.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI.lib/Unicode/JKI Unicode.lvlib"/>
				<Item Name="MD5Checksum format message-digest.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum format message-digest.vi"/>
				<Item Name="MD5Checksum core.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum core.vi"/>
				<Item Name="MD5Checksum pad.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum pad.vi"/>
				<Item Name="MD5Checksum string.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum string.vi"/>
				<Item Name="Clear All Errors__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Clear All Errors__jki_lib_error_handling.vi"/>
				<Item Name="PathToUNIXPathString.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/CFURL.llb/PathToUNIXPathString.vi"/>
				<Item Name="LabVIEW Blowfish Encryption__jki_lib_data_manipulation.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_data_manipulation.llb/LabVIEW Blowfish Encryption__jki_lib_data_manipulation.vi"/>
				<Item Name="Registry View.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry View.ctl"/>
				<Item Name="Registry RtKey.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry RtKey.ctl"/>
				<Item Name="Open Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Open Registry Key.vi"/>
				<Item Name="Read Registry Value Simple.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple.vi"/>
				<Item Name="Read Registry Value Simple STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple STR.vi"/>
				<Item Name="Close Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Close Registry Key.vi"/>
				<Item Name="Registry SAM.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry SAM.ctl"/>
				<Item Name="Append File Path to Error String__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Append File Path to Error String__jki_lib_file.vi"/>
				<Item Name="OpenG Delete Recursive (with File Path in Error String)__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/OpenG Delete Recursive (with File Path in Error String)__jki_lib_file.vi"/>
				<Item Name="Replace all instances of a String__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Replace all instances of a String__jki_lib_string.vi"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="X in Y (String)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (String)__jki_lib_array.vi"/>
				<Item Name="X in Y (I32)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (I32)__jki_lib_array.vi"/>
				<Item Name="X in Y (I32 Array)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (I32 Array)__jki_lib_array.vi"/>
				<Item Name="X in Y (String Array)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (String Array)__jki_lib_array.vi"/>
				<Item Name="X in Y (Variant)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (Variant)__jki_lib_array.vi"/>
				<Item Name="X in Y (Variant Array)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (Variant Array)__jki_lib_array.vi"/>
				<Item Name="X in Y (Path)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (Path)__jki_lib_array.vi"/>
				<Item Name="X in Y (Path Array)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y (Path Array)__jki_lib_array.vi"/>
				<Item Name="X in Y__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/X in Y__jki_lib_array.vi"/>
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="Build Error Cluster__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Build Error Cluster__jki_lib_error_handling.vi"/>
				<Item Name="Get Calling UI (Open FP) Reference__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Calling UI (Open FP) Reference__jki_lib_dialog.vi"/>
				<Item Name="Center Panel Reference - Enum - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Center Panel Reference - Enum - __jki_lib_dialog.ctl"/>
				<Item Name="Center Panel__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Center Panel__jki_lib_dialog.vi"/>
				<Item Name="RectSize.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/RectSize.vi"/>
				<Item Name="Get Primary Display Size__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Primary Display Size__jki_lib_dialog.vi"/>
				<Item Name="Get Max Min Dialog Size__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Max Min Dialog Size__jki_lib_dialog.vi"/>
				<Item Name="Do Not Show Dialog Vertical Offset__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Do Not Show Dialog Vertical Offset__jki_lib_dialog.vi"/>
				<Item Name="Get Spacing Between Objects__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Spacing Between Objects__jki_lib_dialog.vi"/>
				<Item Name="Get Distance From Lower Right Edge__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Distance From Lower Right Edge__jki_lib_dialog.vi"/>
				<Item Name="Compute Dialog Box Window Size__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Compute Dialog Box Window Size__jki_lib_dialog.vi"/>
				<Item Name="Set Window Size__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Set Window Size__jki_lib_dialog.vi"/>
				<Item Name="Get Distance From Upper Left Edge__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Distance From Upper Left Edge__jki_lib_dialog.vi"/>
				<Item Name="Set Dialog Image Position__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Set Dialog Image Position__jki_lib_dialog.vi"/>
				<Item Name="Get All Front Panel Controls__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get All Front Panel Controls__jki_lib_dialog.vi"/>
				<Item Name="Get All Front Panel Controls (with cache)__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get All Front Panel Controls (with cache)__jki_lib_dialog.vi"/>
				<Item Name="Get Named Control Reference__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Named Control Reference__jki_lib_dialog.vi"/>
				<Item Name="Button Skin - Enum - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Button Skin - Enum - __jki_lib_dialog.ctl"/>
				<Item Name="Hide Unused Cluster Skin__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Hide Unused Cluster Skin__jki_lib_dialog.vi"/>
				<Item Name="Get Default Button Size__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Default Button Size__jki_lib_dialog.vi"/>
				<Item Name="Buttons to Show info - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Buttons to Show info - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Selected Skin Data - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Selected Skin Data - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Set Buttons Properties__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Set Buttons Properties__jki_lib_dialog.vi"/>
				<Item Name="Cluster Autosizing - Enum - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Cluster Autosizing - Enum - __jki_lib_dialog.ctl"/>
				<Item Name="Set Button(s) Position and Properties__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Set Button(s) Position and Properties__jki_lib_dialog.vi"/>
				<Item Name="Get Max Min Text Message Box Size__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Max Min Text Message Box Size__jki_lib_dialog.vi"/>
				<Item Name="Get Single Line Max Width and Max Height__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Single Line Max Width and Max Height__jki_lib_dialog.vi"/>
				<Item Name="Get Longest String Length Accounting for Formatting__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Get Longest String Length Accounting for Formatting__jki_lib_dialog.vi"/>
				<Item Name="Estimate Total Buton Sizes__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Estimate Total Buton Sizes__jki_lib_dialog.vi"/>
				<Item Name="Compute Message Display size and Position__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Compute Message Display size and Position__jki_lib_dialog.vi"/>
				<Item Name="Text Justification - Enum - __jki_lib_rich_text_formatting.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Text Justification - Enum - __jki_lib_rich_text_formatting.ctl"/>
				<Item Name="Default Properties with background color - cluster - __jki_lib_rich_text_formatting.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Default Properties with background color - cluster - __jki_lib_rich_text_formatting.ctl"/>
				<Item Name="Text Properties - cluster - __jki_lib_rich_text_formatting.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Text Properties - cluster - __jki_lib_rich_text_formatting.ctl"/>
				<Item Name="Apply Formatting to Text__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Apply Formatting to Text__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Map Justify Argument to Justify Enum__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Map Justify Argument to Justify Enum__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Named Color Map__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Named Color Map__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Color Argument To Color HEX__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Color Argument To Color HEX__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Supported Tags - Enum - __jki_lib_rich_text_formatting.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Supported Tags - Enum - __jki_lib_rich_text_formatting.ctl"/>
				<Item Name="Map Tag String to Tag Enum plus Argument__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Map Tag String to Tag Enum plus Argument__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Cancel Tag Parsing [Character]__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Cancel Tag Parsing [Character]__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Validate Tag__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Validate Tag__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Advanced Match First String__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Advanced Match First String__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Advanced Match First String with or without Case Sensitivity__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Advanced Match First String with or without Case Sensitivity__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Supported Rich Text Tags__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Supported Rich Text Tags__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Extract Tag from Formatted String__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Extract Tag from Formatted String__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Parse Formatted Text__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Parse Formatted Text__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Default Properties - cluster - __jki_lib_rich_text_formatting.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Default Properties - cluster - __jki_lib_rich_text_formatting.ctl"/>
				<Item Name="Simple Formatter [String Class]__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Simple Formatter [String Class]__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Simple Formatter [Text Class]__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Simple Formatter [Text Class]__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Simple Formatter__jki_lib_rich_text_formatting.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_rich_text_formatting.llb/Simple Formatter__jki_lib_rich_text_formatting.vi"/>
				<Item Name="Get Caller Panel Color__jki_lib_user_interface.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_User_Interface.llb/Get Caller Panel Color__jki_lib_user_interface.vi"/>
				<Item Name="Beep.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/Beep.vi"/>
				<Item Name="Register Controls In VCluster to VArray__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Register Controls In VCluster to VArray__jki_lib_dialog.vi"/>
				<Item Name="Register Controls In VCluster to VArray (with cache)__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Register Controls In VCluster to VArray (with cache)__jki_lib_dialog.vi"/>
				<Item Name="Register Buttons in VCluster And get Select Button Ref__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Register Buttons in VCluster And get Select Button Ref__jki_lib_dialog.vi"/>
				<Item Name="Dialog Outputs - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Dialog Outputs - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Debugging Options - Cluster -__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Debugging Options - Cluster -__jki_lib_dialog.ctl"/>
				<Item Name="Controls Reference - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Controls Reference - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Image Type - Enum - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Image Type - Enum - __jki_lib_dialog.ctl"/>
				<Item Name="Dialog Inputs - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Dialog Inputs - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Dialog App Data - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Dialog App Data - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Dialog App Data Cluster Wrapper__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Dialog App Data Cluster Wrapper__jki_lib_dialog.vi"/>
				<Item Name="Parse String To Lines__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Parse String To Lines__jki_lib_string.vi"/>
				<Item Name="Global - Button Skin__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Global - Button Skin__jki_lib_dialog.vi"/>
				<Item Name="Test if Button Skin Enum input was wired__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Test if Button Skin Enum input was wired__jki_lib_dialog.vi"/>
				<Item Name="LVPositionTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPositionTypeDef.ctl"/>
				<Item Name="JKI Flat 2.0 - Side Image - Pic Ring__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI Flat 2.0 - Side Image - Pic Ring__jki_lib_dialog.ctl"/>
				<Item Name="JKI Flat 2.0 Button Set - Type Def - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI Flat 2.0 Button Set - Type Def - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="All Options - Cluster -__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/All Options - Cluster -__jki_lib_dialog.ctl"/>
				<Item Name="LabVIEW 3D Button Set - Type Def - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/LabVIEW 3D Button Set - Type Def - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="LabVIEW Classic Button Set - Type Def - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/LabVIEW Classic Button Set - Type Def - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Crystal Button Set - Type Def - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Crystal Button Set - Type Def - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="Nuvola - Side Image - Pic Ring__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Nuvola - Side Image - Pic Ring__jki_lib_dialog.ctl"/>
				<Item Name="Nuvola 1.0 Button Set - Type Def - Cluster - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Nuvola 1.0 Button Set - Type Def - Cluster - __jki_lib_dialog.ctl"/>
				<Item Name="N Button(s) Dialog - core - __jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/N Button(s) Dialog - core - __jki_lib_dialog.vi"/>
				<Item Name="N Button(s) Dialog__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/N Button(s) Dialog__jki_lib_dialog.vi"/>
				<Item Name="Presets (Result) - Enum - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Presets (Result) - Enum - __jki_lib_dialog.ctl"/>
				<Item Name="Presets (Input) - Enum - __jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Presets (Input) - Enum - __jki_lib_dialog.ctl"/>
				<Item Name="Most Common Dialog Boxes__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Most Common Dialog Boxes__jki_lib_dialog.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="compatWriteText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatWriteText.vi"/>
				<Item Name="Write File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write File+ (string).vi"/>
				<Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
				<Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
				<Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
				<Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
				<Item Name="Write Characters To File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Characters To File.vi"/>
				<Item Name="Create Error File__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Create Error File__jki_lib_error_handling.vi"/>
				<Item Name="Error Mode__jki_lib_error_handling.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Error Mode__jki_lib_error_handling.ctl"/>
				<Item Name="Error Global__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Error Global__jki_lib_error_handling.vi"/>
				<Item Name="Error Handler Shifter__jki_lib_error_handling.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Error Handler Shifter__jki_lib_error_handling.ctl"/>
				<Item Name="Error Handler__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Error Handler__jki_lib_error_handling.vi"/>
				<Item Name="NI_WebDAV.lvlib" Type="Library" URL="/&lt;vilib&gt;/WebDAVClient/NI_WebDAV.lvlib"/>
				<Item Name="Create Directory Recursive.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Create Directory Recursive.vi"/>
				<Item Name="Create Empty Set__vipm_lv_collection_ext.vim" Type="VI" URL="/&lt;vilib&gt;/VIPM/Collection_Extensions/Set/Create Empty Set__vipm_lv_collection_ext.vim"/>
				<Item Name="Convert Array to Set__vipm_lv_collection_ext.vim" Type="VI" URL="/&lt;vilib&gt;/VIPM/Collection_Extensions/Set/Convert Array to Set__vipm_lv_collection_ext.vim"/>
				<Item Name="LVMapReplaceAction.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVMapReplaceAction.ctl"/>
				<Item Name="EscapeChars.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/EscapeChars.vi"/>
				<Item Name="Strip URL__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Strip URL__jki_lib_file.vi"/>
				<Item Name="PkgDir Get URL Separator__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/PkgDir Get URL Separator__jki_lib_file.vi"/>
				<Item Name="Get URL Type__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Get URL Type__jki_lib_file.vi"/>
				<Item Name="URL Type Enum__jki_lib_file.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/URL Type Enum__jki_lib_file.ctl"/>
				<Item Name="Build URL__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Build URL__jki_lib_file.vi"/>
				<Item Name="Encode URL__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Encode URL__jki_lib_file.vi"/>
				<Item Name="Decode URL__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Decode URL__jki_lib_file.vi"/>
				<Item Name="URL Special Characters Constant__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/URL Special Characters Constant__jki_lib_file.vi"/>
				<Item Name="Config Encode String as Hex__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Config Encode String as Hex__jki_lib_file.vi"/>
				<Item Name="Add New Key__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Add New Key__jki_lib_string.vi"/>
				<Item Name="dictionary cluster__jki_lib_string.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/dictionary cluster__jki_lib_string.ctl"/>
				<Item Name="Easy Write XML File__JKI EasyXML.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/EasyXML/JKI_EasyXML.llb/Easy Write XML File__JKI EasyXML.vi"/>
				<Item Name="R-W Text File__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/R-W Text File__jki_lib_file.vi"/>
				<Item Name="R-W Text File Mode Enum__jki_lib_file.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/R-W Text File Mode Enum__jki_lib_file.ctl"/>
				<Item Name="change read-write file attribute__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/change read-write file attribute__jki_lib_file.vi"/>
				<Item Name="File Dialog__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/File Dialog__jki_lib_file.vi"/>
				<Item Name="Bring Window to Top__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Bring Window to Top__jki_lib_dialog.vi"/>
				<Item Name="move window to top__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/move window to top__jki_lib_windows.vi"/>
				<Item Name="window refnum__jki_lib_windows.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/window refnum__jki_lib_windows.ctl"/>
				<Item Name="get window refnum__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/get window refnum__jki_lib_windows.vi"/>
				<Item Name="set window z-position__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/set window z-position__jki_lib_windows.vi"/>
				<Item Name="not a window refnum__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/not a window refnum__jki_lib_windows.vi"/>
				<Item Name="compatOverwrite.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOverwrite.vi"/>
				<Item Name="Local UTC Offset__jki_lib_time.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_time.llb/Local UTC Offset__jki_lib_time.vi"/>
				<Item Name="Decode Data from Hex__jki_lib_data_manipulation.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_data_manipulation.llb/Decode Data from Hex__jki_lib_data_manipulation.vi"/>
				<Item Name="Open Config String__jki_lib_configuration_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_configuration_file.llb/Open Config String__jki_lib_configuration_file.vi"/>
				<Item Name="JKI_LVConfig__jki_lib_configuration_file.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_configuration_file.llb/JKI_LVConfig__jki_lib_configuration_file.lvlib"/>
				<Item Name="Read BMP File(6_1).vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File(6_1).vi"/>
				<Item Name="Read BMP File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File.vi"/>
				<Item Name="Read BMP File Data.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File Data.vi"/>
				<Item Name="Read BMP Header Info.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP Header Info.vi"/>
				<Item Name="Calc Long Word Padded Width.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Calc Long Word Padded Width.vi"/>
				<Item Name="Flip and Pad for Picture Control.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Flip and Pad for Picture Control.vi"/>
				<Item Name="Read JPEG File(6_1).vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Read JPEG File(6_1).vi"/>
				<Item Name="Read JPEG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Read JPEG File.vi"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="Read PNG File(6_1).vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Read PNG File(6_1).vi"/>
				<Item Name="Read PNG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Read PNG File.vi"/>
				<Item Name="Create Mask By Alpha.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Create Mask By Alpha.vi"/>
				<Item Name="Bit-array To Byte-array.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Bit-array To Byte-array.vi"/>
				<Item Name="Draw Flattened Pixmap(6_1).vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap(6_1).vi"/>
				<Item Name="Draw Flattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap.vi"/>
				<Item Name="FixBadRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/FixBadRect.vi"/>
				<Item Name="Get Any Windows Folder Path__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/Get Any Windows Folder Path__jki_lib_windows.vi"/>
				<Item Name="Normalize End Of Line.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Normalize End Of Line.vi"/>
				<Item Name="GetFileVersionInfo_Main__jki_lib_application_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_application_control.llb/GetFileVersionInfo_Main__jki_lib_application_control.vi"/>
				<Item Name="Get Redirects.vi" Type="VI" URL="/&lt;vilib&gt;/JKI/HTTP Client Extensions/HTTPx/Get Redirects.vi"/>
				<Item Name="Compare Version Strings__jki_lib_application_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_application_control.llb/Compare Version Strings__jki_lib_application_control.vi"/>
				<Item Name="Version Comparison Enum__jki_lib_application_control.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_application_control.llb/Version Comparison Enum__jki_lib_application_control.ctl"/>
				<Item Name="Read Registry Value Simple U32.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple U32.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Generate Temporary File Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Generate Temporary File Path.vi"/>
				<Item Name="JSONtext.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JSONtext/JSONtext.lvlib"/>
				<Item Name="extract window origin - size__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/extract window origin - size__jki_lib_windows.vi"/>
				<Item Name="window rectangle__jki_lib_windows.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/window rectangle__jki_lib_windows.ctl"/>
				<Item Name="XML to Variant__jki_lib_data_manipulation.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_data_manipulation.llb/XML to Variant__jki_lib_data_manipulation.vi"/>
				<Item Name="Easy Generate XML__JKI EasyXML.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/EasyXML/JKI_EasyXML.llb/Easy Generate XML__JKI EasyXML.vi"/>
				<Item Name="Is an Error__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Is an Error__jki_lib_error_handling.vi"/>
				<Item Name="Is an Error (error cluster)__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Is an Error (error cluster)__jki_lib_error_handling.vi"/>
				<Item Name="Is an Error (error array)__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Is an Error (error array)__jki_lib_error_handling.vi"/>
				<Item Name="Is an Error (any error array element)__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Is an Error (any error array element)__jki_lib_error_handling.vi"/>
				<Item Name="Easy Parse XML__JKI EasyXML.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/EasyXML/JKI_EasyXML.llb/Easy Parse XML__JKI EasyXML.vi"/>
				<Item Name="Acquire Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Acquire Semaphore.vi"/>
				<Item Name="Semaphore RefNum" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore RefNum"/>
				<Item Name="Semaphore Refnum Core.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore Refnum Core.ctl"/>
				<Item Name="Create Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Create Semaphore.vi"/>
				<Item Name="Semaphore Name &amp; Ref DB Action.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore Name &amp; Ref DB Action.ctl"/>
				<Item Name="Semaphore Name &amp; Ref DB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore Name &amp; Ref DB.vi"/>
				<Item Name="Not A Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Not A Semaphore.vi"/>
				<Item Name="Get Semaphore Status.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Get Semaphore Status.vi"/>
				<Item Name="RemoveNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/RemoveNamedSemaphorePrefix.vi"/>
				<Item Name="GetNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/GetNamedSemaphorePrefix.vi"/>
				<Item Name="Obtain Semaphore Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Obtain Semaphore Reference.vi"/>
				<Item Name="AddNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/AddNamedSemaphorePrefix.vi"/>
				<Item Name="Validate Semaphore Size.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Validate Semaphore Size.vi"/>
				<Item Name="Release Semaphore_71.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore_71.vi"/>
				<Item Name="Release Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore.vi"/>
				<Item Name="Strip Action - Enum__jki_lib_application_control.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_application_control.llb/Strip Action - Enum__jki_lib_application_control.ctl"/>
				<Item Name="Strip Version Number__jki_lib_application_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_application_control.llb/Strip Version Number__jki_lib_application_control.vi"/>
				<Item Name="Enum Registry Keys.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Enum Registry Keys.vi"/>
				<Item Name="Query Registry Key Info.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Query Registry Key Info.vi"/>
				<Item Name="MD5Checksum File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum File.vi"/>
				<Item Name="Is Child Path__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Is Child Path__jki_lib_file.vi"/>
				<Item Name="Common Path to Specific Path (JKI)__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Common Path to Specific Path (JKI)__jki_lib_file.vi"/>
				<Item Name="N Button(s) Dialog - High Level - __jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/N Button(s) Dialog - High Level - __jki_lib_dialog.vi"/>
				<Item Name="Filter Error Codes__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Filter Error Codes__jki_lib_error_handling.vi"/>
				<Item Name="Filter Error Codes (Array)__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Filter Error Codes (Array)__jki_lib_error_handling.vi"/>
				<Item Name="Filtered Error Details - Cluster__jki_lib_error_handling.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Filtered Error Details - Cluster__jki_lib_error_handling.ctl"/>
				<Item Name="Filter Error Codes (Scalar)__jki_lib_error_handling.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Error_Handling.llb/Filter Error Codes (Scalar)__jki_lib_error_handling.vi"/>
				<Item Name="JKI pwd controller action__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI pwd controller action__jki_lib_dialog.ctl"/>
				<Item Name="JKI pwd controller__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI pwd controller__jki_lib_dialog.vi"/>
				<Item Name="Throbber Animation__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Throbber Animation__jki_lib_dialog.ctl"/>
				<Item Name="JKI pwd queue manager mode enum__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI pwd queue manager mode enum__jki_lib_dialog.ctl"/>
				<Item Name="JKI pwd queue manager__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI pwd queue manager__jki_lib_dialog.vi"/>
				<Item Name="JKI pwd queue data cluster__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI pwd queue data cluster__jki_lib_dialog.ctl"/>
				<Item Name="JKI pwd gui__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI pwd gui__jki_lib_dialog.vi"/>
				<Item Name="Open System Command Pipe.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/Open System Command Pipe.vi"/>
				<Item Name="Read From Pipe.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/Read From Pipe.vi"/>
				<Item Name="Close Pipe.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/Close Pipe.vi"/>
				<Item Name="Split String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Split String.vi"/>
				<Item Name="Strings Equal (Case Insensitive)__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Strings Equal (Case Insensitive)__jki_lib_string.vi"/>
				<Item Name="Strings Equal (Case Insensitive) - Scalar Scalar__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Strings Equal (Case Insensitive) - Scalar Scalar__jki_lib_string.vi"/>
				<Item Name="Strings Equal (Case Insensitive) - Array Scalar__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Strings Equal (Case Insensitive) - Array Scalar__jki_lib_string.vi"/>
				<Item Name="Strings Equal (Case Insensitive) - Scalar Array__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Strings Equal (Case Insensitive) - Scalar Array__jki_lib_string.vi"/>
				<Item Name="Strings Equal (Case Insensitive) - Array Array__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Strings Equal (Case Insensitive) - Array Array__jki_lib_string.vi"/>
				<Item Name="Windows Task List all Process IDs__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/Windows Task List all Process IDs__jki_lib_windows.vi"/>
				<Item Name="WinTask.TaskCluster_TypeDef__jki_lib_windows.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/WinTask.TaskCluster_TypeDef__jki_lib_windows.ctl"/>
				<Item Name="Build State String with Arguments__JKI_lib_State_Machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Build State String with Arguments__JKI_lib_State_Machine.vi"/>
				<Item Name="Get All FP Decorations__jki_lib_application_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_application_control.llb/Get All FP Decorations__jki_lib_application_control.vi"/>
				<Item Name="Fit VI Window to Control__jki_lib_user_interface.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_User_Interface.llb/Fit VI Window to Control__jki_lib_user_interface.vi"/>
				<Item Name="Generic text entry prompt__jki_lib_dialog.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/Generic text entry prompt__jki_lib_dialog.vi"/>
				<Item Name="JKI Flat 2.0 - OK YES - Button__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI Flat 2.0 - OK YES - Button__jki_lib_dialog.ctl"/>
				<Item Name="JKI Flat 2.0 - Cancel - Button__jki_lib_dialog.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_Dialog.llb/JKI Flat 2.0 - Cancel - Button__jki_lib_dialog.ctl"/>
				<Item Name="LVKeyTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVKeyTypeDef.ctl"/>
				<Item Name="LVRowAndColumnUnsignedTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRowAndColumnUnsignedTypeDef.ctl"/>
				<Item Name="Is a Version String__jki_lib_application_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_application_control.llb/Is a Version String__jki_lib_application_control.vi"/>
				<Item Name="Specific Path to Common Path (JKI)__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Specific Path to Common Path (JKI)__jki_lib_file.vi"/>
				<Item Name="Write Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet.vi"/>
				<Item Name="Write Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (I64).vi"/>
				<Item Name="Write Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (string).vi"/>
				<Item Name="Get File System.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysinfo.llb/Get File System.vi"/>
				<Item Name="Single to Double Backslash (JKI)__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Single to Double Backslash (JKI)__jki_lib_file.vi"/>
				<Item Name="convert wildcard expression to regular expression__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/convert wildcard expression to regular expression__jki_lib_string.vi"/>
				<Item Name="List Files and Directories Recursively with Exclusion__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/List Files and Directories Recursively with Exclusion__jki_lib_file.vi"/>
				<Item Name="List Files and Directories Recursively__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/List Files and Directories Recursively__jki_lib_file.vi"/>
				<Item Name="Match 1D String Array.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Match 1D String Array.vi"/>
				<Item Name="Match Regular Expression_Execute.vi" Type="VI" URL="/&lt;vilib&gt;/regexp/Match Regular Expression_Execute.vi"/>
				<Item Name="Match Regular Expression_ExecuteOffsets.vi" Type="VI" URL="/&lt;vilib&gt;/regexp/Match Regular Expression_ExecuteOffsets.vi"/>
				<Item Name="LVPoint32TypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPoint32TypeDef.ctl"/>
				<Item Name="Encode Data to Hex__jki_lib_data_manipulation.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_data_manipulation.llb/Encode Data to Hex__jki_lib_data_manipulation.vi"/>
				<Item Name="Empty Picture" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Empty Picture"/>
				<Item Name="Check if Path has Pathroot__jki_lib_variant.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_variant.llb/Check if Path has Pathroot__jki_lib_variant.vi"/>
				<Item Name="Draw Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Rect.vi"/>
				<Item Name="Set Pen State.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Set Pen State.vi"/>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi"/>
				<Item Name="Flatten Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pixmap.llb/Flatten Pixmap.vi"/>
				<Item Name="Translate Image Data__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Translate Image Data__jki_lib_picture.vi"/>
				<Item Name="CenterRectInBnds.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/CenterRectInBnds.vi"/>
				<Item Name="RectCentroid.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/RectCentroid.vi"/>
				<Item Name="POffsetRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/POffsetRect.vi"/>
				<Item Name="RectAndRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/RectAndRect.vi"/>
				<Item Name="Create Mask.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Create Mask.vi"/>
				<Item Name="Unflatten Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pixmap.llb/Unflatten Pixmap.vi"/>
				<Item Name="Hilite Color.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Hilite Color.vi"/>
				<Item Name="Draw Multiple Lines.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Multiple Lines.vi"/>
				<Item Name="Picture to Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Picture to Pixmap.vi"/>
				<Item Name="Pixmap Flood Fill__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Pixmap Flood Fill__jki_lib_picture.vi"/>
				<Item Name="Get Pixel Color__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Get Pixel Color__jki_lib_picture.vi"/>
				<Item Name="Set Pixel Color__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Set Pixel Color__jki_lib_picture.vi"/>
				<Item Name="Flood Fill - Get Next Points - __jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Flood Fill - Get Next Points - __jki_lib_picture.vi"/>
				<Item Name="PointInRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/PointInRect.vi"/>
				<Item Name="Unflatten Pixmap (Fast)__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Unflatten Pixmap (Fast)__jki_lib_picture.vi"/>
				<Item Name="Make Paths Absolute in VData__jki_lib_variant.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_variant.llb/Make Paths Absolute in VData__jki_lib_variant.vi"/>
				<Item Name="Palette Menu.lvlib" Type="Library" URL="/&lt;vilib&gt;/Palette API/Palette Menu/Palette Menu.lvlib"/>
				<Item Name="Unescape XML.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Unescape XML.vi"/>
				<Item Name="FindFirstTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindFirstTag.vi"/>
				<Item Name="FindEmptyElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindEmptyElement.vi"/>
				<Item Name="FindElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElement.vi"/>
				<Item Name="FindMatchingCloseTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindMatchingCloseTag.vi"/>
				<Item Name="FindCloseTagByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindCloseTagByName.vi"/>
				<Item Name="FindElementStartByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElementStartByName.vi"/>
				<Item Name="UnescapeChar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/UnescapeChar.vi"/>
				<Item Name="Mask surrounding pixels__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Mask surrounding pixels__jki_lib_picture.vi"/>
				<Item Name="Librarian Copy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Copy.vi"/>
				<Item Name="Compare Src And Dst.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Src And Dst.vi"/>
				<Item Name="Are Paths Equal.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Are Paths Equal.vi"/>
				<Item Name="Copy In Or Out Of VI Library.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Copy In Or Out Of VI Library.vi"/>
				<Item Name="Librarian OK to Delete.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian OK to Delete.vi"/>
				<Item Name="Librarian Delete Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Delete Dialog.vi"/>
				<Item Name="Prepare VI Library for Copy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Prepare VI Library for Copy.vi"/>
				<Item Name="Temp Backup File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Temp Backup File.vi"/>
				<Item Name="Temp Filename.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Temp Filename.vi"/>
				<Item Name="Temp Restore File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Temp Restore File.vi"/>
				<Item Name="Copy From Folder To Folder.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Copy From Folder To Folder.vi"/>
				<Item Name="Compare Src And Dst Simple.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Src And Dst Simple.vi"/>
				<Item Name="Copy From And To VI Library.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Copy From And To VI Library.vi"/>
				<Item Name="Delete From VI Library.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Delete From VI Library.vi"/>
				<Item Name="Librarian Rename.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Rename.vi"/>
				<Item Name="Librarian Delete.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Delete.vi"/>
				<Item Name="Delete Directory Recursive.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Delete Directory Recursive.vi"/>
				<Item Name="Expand directory from file paths list__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Expand directory from file paths list__jki_lib_file.vi"/>
				<Item Name="NI_Unzip.lvlib" Type="Library" URL="/&lt;vilib&gt;/zip/NI_Unzip.lvlib"/>
				<Item Name="Integer &amp; Fractional Parts__jki_lib_math.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_math.llb/Integer &amp; Fractional Parts__jki_lib_math.vi"/>
				<Item Name="Draw Grayed Out Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Grayed Out Rect.vi"/>
				<Item Name="Draw Text in Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Text in Rect.vi"/>
				<Item Name="PCT Pad String.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/PCT Pad String.vi"/>
				<Item Name="SetMenuItemInfoSCConverter.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/SetMenuItemInfoSCConverter.vi"/>
				<Item Name="Increment Build Number__jki_lib_project_build_tools.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_project_build_tools.llb/Increment Build Number__jki_lib_project_build_tools.vi"/>
				<Item Name="Convert Version Data to Version GUI Cluster__jki_lib_project_build_tools.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_project_build_tools.llb/Convert Version Data to Version GUI Cluster__jki_lib_project_build_tools.vi"/>
				<Item Name="Convert Version GUI Cluster to Version Data__jki_lib_project_build_tools.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_project_build_tools.llb/Convert Version GUI Cluster to Version Data__jki_lib_project_build_tools.vi"/>
				<Item Name="Version display - Cluster -__jki_lib_project_build_tools.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_project_build_tools.llb/Version display - Cluster -__jki_lib_project_build_tools.ctl"/>
				<Item Name="Platform Path Separator Constant__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Platform Path Separator Constant__jki_lib_file.vi"/>
				<Item Name="lveventtype.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/lveventtype.ctl"/>
				<Item Name="Check Rectangle Inclusion__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Check Rectangle Inclusion__jki_lib_picture.vi"/>
				<Item Name="PointInRect (Bug Fix)__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/PointInRect (Bug Fix)__jki_lib_picture.vi"/>
				<Item Name="Point and Size to Rectangle__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Point and Size to Rectangle__jki_lib_picture.vi"/>
				<Item Name="Point2Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/Point2Rect.vi"/>
				<Item Name="Merge Image Data__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Merge Image Data__jki_lib_picture.vi"/>
				<Item Name="Get Image Subset (Fast)__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Get Image Subset (Fast)__jki_lib_picture.vi"/>
				<Item Name="Coerce Bad Rectangle (Bug Fix)__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Coerce Bad Rectangle (Bug Fix)__jki_lib_picture.vi"/>
				<Item Name="Coerce Bad Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Coerce Bad Rect.vi"/>
				<Item Name="Flatten Pixmap (Fast)__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Flatten Pixmap (Fast)__jki_lib_picture.vi"/>
				<Item Name="Build Error Cluster__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Build Error Cluster__jki_lib_picture.vi"/>
				<Item Name="move window__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/move window__jki_lib_windows.vi"/>
				<Item Name="get window rectangle__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/get window rectangle__jki_lib_windows.vi"/>
				<Item Name="RGB to Color.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/RGB to Color.vi"/>
				<Item Name="Read Mouse__jki_lib_input_devices.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_input_devices.llb/Read Mouse__jki_lib_input_devices.vi"/>
				<Item Name="LVSelectionTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVSelectionTypeDef.ctl"/>
				<Item Name="Caller Path with New Extension__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Caller Path with New Extension__jki_lib_file.vi"/>
				<Item Name="Merge Directory with Mask__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Merge Directory with Mask__jki_lib_file.vi"/>
				<Item Name="Compare Two Files__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Compare Two Files__jki_lib_file.vi"/>
				<Item Name="Write Characters to File - With Error in and Error Out - __jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Write Characters to File - With Error in and Error Out - __jki_lib_file.vi"/>
				<Item Name="Write BMP File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Write BMP File.vi"/>
				<Item Name="Write BMP Data.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Write BMP Data.vi"/>
				<Item Name="Write BMP Data To Buffer.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Write BMP Data To Buffer.vi"/>
				<Item Name="Interleave String__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Interleave String__jki_lib_string.vi"/>
				<Item Name="Librarian List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian List.vi"/>
				<Item Name="Get VI Library List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get VI Library List.vi"/>
				<Item Name="Create Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create Rendezvous.vi"/>
				<Item Name="Rendezvous RefNum" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Rendezvous RefNum"/>
				<Item Name="Rendezvous Name &amp; Ref DB Action.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Rendezvous Name &amp; Ref DB Action.ctl"/>
				<Item Name="Rendezvous Name &amp; Ref DB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Rendezvous Name &amp; Ref DB.vi"/>
				<Item Name="Not A Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Not A Rendezvous.vi"/>
				<Item Name="RendezvousDataCluster.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/RendezvousDataCluster.ctl"/>
				<Item Name="Create New Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create New Rendezvous.vi"/>
				<Item Name="AddNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/AddNamedRendezvousPrefix.vi"/>
				<Item Name="GetNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/GetNamedRendezvousPrefix.vi"/>
				<Item Name="Wait at Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Wait at Rendezvous.vi"/>
				<Item Name="Release Waiting Procs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Release Waiting Procs.vi"/>
				<Item Name="Destroy Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Destroy Rendezvous.vi"/>
				<Item Name="Destroy A Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Destroy A Rendezvous.vi"/>
				<Item Name="RemoveNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/RemoveNamedRendezvousPrefix.vi"/>
				<Item Name="JSONtext LVClass Serializer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/JDP Science/JSONtext/LVClass Serializer/JSONtext LVClass Serializer.lvclass"/>
				<Item Name="JDP Utility.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/JDP Utility.lvlib"/>
				<Item Name="Base64 Support.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Base64/Base64 Support.lvlib"/>
				<Item Name="JDP Timestamp.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Timestamp/JDP Timestamp.lvlib"/>
				<Item Name="LVNumericRepresentation.ctl" Type="VI" URL="/&lt;vilib&gt;/numeric/LVNumericRepresentation.ctl"/>
				<Item Name="LVPointTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPointTypeDef.ctl"/>
				<Item Name="Add State(s) to Queue__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Add State(s) to Queue__jki_lib_state_machine.vi"/>
				<Item Name="restore window__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/restore window__jki_lib_windows.vi"/>
				<Item Name="postmessage master__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/postmessage master__jki_lib_windows.vi"/>
				<Item Name="FindWindow__jki_lib_windows.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_windows.llb/FindWindow__jki_lib_windows.vi"/>
				<Item Name="OffsetRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/PictureSupport.llb/OffsetRect.vi"/>
				<Item Name="TREE_Set Symbols__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Set Symbols__jki_lib_tree_control.vi"/>
				<Item Name="TREE_Load Symbols__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Load Symbols__jki_lib_tree_control.vi"/>
				<Item Name="Get file image shell__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Get file image shell__jki_lib_picture.vi"/>
				<Item Name="Get file image shell - core - __jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Get file image shell - core - __jki_lib_picture.vi"/>
				<Item Name="Alphs Blend Glyphs __jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Alphs Blend Glyphs __jki_lib_picture.vi"/>
				<Item Name="Create Mask By Alpha - Advanced -__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Create Mask By Alpha - Advanced -__jki_lib_picture.vi"/>
				<Item Name="Draw Flatten Pixmap__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Draw Flatten Pixmap__jki_lib_picture.vi"/>
				<Item Name="Draw Flattened Pixmap (Fast)__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Draw Flattened Pixmap (Fast)__jki_lib_picture.vi"/>
				<Item Name="Strip Path Extension__ogtk__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Strip Path Extension__ogtk__jki_lib_picture.vi"/>
				<Item Name="Strip Path Extension - Path__ogtk__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Strip Path Extension - Path__ogtk__jki_lib_picture.vi"/>
				<Item Name="Strip Path Extension - String__ogtk__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Strip Path Extension - String__ogtk__jki_lib_picture.vi"/>
				<Item Name="Strip Path Extension - 1D Array of Paths__ogtk__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Strip Path Extension - 1D Array of Paths__ogtk__jki_lib_picture.vi"/>
				<Item Name="Strip Path Extension - 1D Array of Strings__ogtk__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/Strip Path Extension - 1D Array of Strings__ogtk__jki_lib_picture.vi"/>
				<Item Name="File Exists__ogtk__jki_lib_picture.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_picture.llb/File Exists__ogtk__jki_lib_picture.vi"/>
				<Item Name="TREE_Tree Empty__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Tree Empty__jki_lib_tree_control.vi"/>
				<Item Name="Read Icons from ICO File.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/icon.llb/Read Icons from ICO File.vi"/>
				<Item Name="Tree_ShowScrollBar.vi" Type="VI" URL="/&lt;vilib&gt;/tree/Tree_ShowScrollBar.vi"/>
				<Item Name="TREE_Get All__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Get All__jki_lib_tree_control.vi"/>
				<Item Name="Read Palette_Preserve Pseudo Path.vi" Type="VI" URL="/&lt;vilib&gt;/Palette API/Preserve Pseudo Path/Read Palette_Preserve Pseudo Path.vi"/>
				<Item Name="Write Palette_Preserve Pseudo Path.vi" Type="VI" URL="/&lt;vilib&gt;/Palette API/Preserve Pseudo Path/Write Palette_Preserve Pseudo Path.vi"/>
				<Item Name="Are Types Coercible__jki_lib_variant.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_variant.llb/Are Types Coercible__jki_lib_variant.vi"/>
				<Item Name="Convert Null Time Stamp to Now__jki_lib_time.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_time.llb/Convert Null Time Stamp to Now__jki_lib_time.vi"/>
				<Item Name="DWDT Empty Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Empty Digital.vi"/>
				<Item Name="DTbl Empty Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Empty Digital.vi"/>
				<Item Name="Compare Array (String)__jki_lib_array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_array.llb/Compare Array (String)__jki_lib_array.vi"/>
				<Item Name="Destroy Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Destroy Semaphore.vi"/>
				<Item Name="Release Semaphore Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore Reference.vi"/>
				<Item Name="Get Value by Key__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Get Value by Key__jki_lib_string.vi"/>
				<Item Name="expand keywords__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/expand keywords__jki_lib_string.vi"/>
				<Item Name="Remove Unprintable Chars (JKI)__jki_lib_file.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_file.llb/Remove Unprintable Chars (JKI)__jki_lib_file.vi"/>
				<Item Name="TREE_Tree Collapse__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Tree Collapse__jki_lib_tree_control.vi"/>
				<Item Name="TREE_Item Add__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Item Add__jki_lib_tree_control.vi"/>
				<Item Name="TREE_Set Node Open or Close__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Set Node Open or Close__jki_lib_tree_control.vi"/>
				<Item Name="update GUI version control__jki_lib_project_build_tools.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_project_build_tools.llb/update GUI version control__jki_lib_project_build_tools.vi"/>
				<Item Name="TREE_Tree Expand__jki_lib_tree_control.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_tree_control.llb/TREE_Tree Expand__jki_lib_tree_control.vi"/>
				<Item Name="LVNodeAndColumnTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVNodeAndColumnTypeDef.ctl"/>
				<Item Name="Create Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Create Registry Key.vi"/>
				<Item Name="Write Registry Value Simple.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value Simple.vi"/>
				<Item Name="Write Registry Value Simple STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value Simple STR.vi"/>
				<Item Name="Write Registry Value Simple U32.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value Simple U32.vi"/>
				<Item Name="New Zip File.vi" Type="VI" URL="/&lt;vilib&gt;/zip/New Zip File.vi"/>
				<Item Name="Add File to Zip.vi" Type="VI" URL="/&lt;vilib&gt;/zip/Add File to Zip.vi"/>
				<Item Name="Relative Path To Platform Independent String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Relative Path To Platform Independent String.vi"/>
				<Item Name="Close Zip File.vi" Type="VI" URL="/&lt;vilib&gt;/zip/Close Zip File.vi"/>
				<Item Name="Tree_Duplicate Tree.vi" Type="VI" URL="/&lt;vilib&gt;/tree/Tree_Duplicate Tree.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="1D String Array to Delimited String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/1D String Array to Delimited String.vi"/>
				<Item Name="Create Empty Map__vipm_lv_collection_ext.vim" Type="VI" URL="/&lt;vilib&gt;/VIPM/Collection_Extensions/Map/Create Empty Map__vipm_lv_collection_ext.vim"/>
				<Item Name="Read From Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File.vi"/>
				<Item Name="Read From Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (DBL).vi"/>
				<Item Name="Read Lines From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File.vi"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read From Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (I64).vi"/>
				<Item Name="Read From Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (string).vi"/>
				<Item Name="Autosize Table Columns__jki_lib_user_interface.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_JKI_lib_User_Interface.llb/Autosize Table Columns__jki_lib_user_interface.vi"/>
				<Item Name="Delete Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Delete Registry Key.vi"/>
				<Item Name="VCluster to Key-Value Pairs__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/VCluster to Key-Value Pairs__jki_lib_string.vi"/>
				<Item Name="Merge Dictionary B into A__jki_lib_string.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI.lib/_jki_lib_string.llb/Merge Dictionary B into A__jki_lib_string.vi"/>
				<Item Name="Read Progress.vi" Type="VI" URL="/&lt;vilib&gt;/JKI/HTTP Client Extensions/HTTP GET Async/Read Progress.vi"/>
				<Item Name="GET Async.vi" Type="VI" URL="/&lt;vilib&gt;/JKI/HTTP Client Extensions/support/GET Async.vi"/>
				<Item Name="Close Reference.vi" Type="VI" URL="/&lt;vilib&gt;/JKI/HTTP Client Extensions/HTTP GET Async/Close Reference.vi"/>
				<Item Name="Refnum Type - Enum.ctl" Type="VI" URL="/&lt;vilib&gt;/JKI/HTTP Client Extensions/controls/Refnum Type - Enum.ctl"/>
				<Item Name="Refnum Type.ctl" Type="VI" URL="/&lt;vilib&gt;/JKI/HTTP Client Extensions/controls/Refnum Type.ctl"/>
			</Item>
			<Item Name="lv_reqwest_64.so" Type="Document" URL="../lv_reqwest_64.so"/>
			<Item Name="JKI_API.lvclass" Type="LVClass" URL="../../../vipm-desktop/source/JKI APIs/JKI_API.lvclass"/>
			<Item Name="NI HTTP -- SmartPathToString -- JKI VIPM.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/HTTP/NI HTTP -- SmartPathToString -- JKI VIPM.vi"/>
			<Item Name="NI HTTP - Get Lib -- JKI VIPM.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/HTTP/NI HTTP - Get Lib -- JKI VIPM.vi"/>
			<Item Name="NI HTTP -- POSTBuffer - JKI VIPM.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/HTTP/NI HTTP -- POSTBuffer - JKI VIPM.vi"/>
			<Item Name="OGPM http Parse Response Code.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http Parse Response Code.vi"/>
			<Item Name="Is an Integer.vi" Type="VI" URL="../../../vipm-desktop/source/Package Name Parsing/Is an Integer.vi"/>
			<Item Name="Split String at Last Hyphen.vi" Type="VI" URL="../../../vipm-desktop/source/Package Name Parsing/Split String at Last Hyphen.vi"/>
			<Item Name="Is Version String.vi" Type="VI" URL="../../../vipm-desktop/source/Package Name Parsing/Is Version String.vi"/>
			<Item Name="OGPM Software Version Number Integer.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Software Version Number Integer.ctl"/>
			<Item Name="Parse Package Version (NEW).vi" Type="VI" URL="../../../vipm-desktop/source/Package Name Parsing/Parse Package Version (NEW).vi"/>
			<Item Name="Parse Package Name (NEW).vi" Type="VI" URL="../../../vipm-desktop/source/Package Name Parsing/Parse Package Name (NEW).vi"/>
			<Item Name="OGPM Parse Package Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Parse Package Name.vi"/>
			<Item Name="OGPM URL Type Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM URL Type Enum.ctl"/>
			<Item Name="OGPM Get URL Type.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Get URL Type.vi"/>
			<Item Name="OGPM PkgDir Get URL Separator.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir Get URL Separator.vi"/>
			<Item Name="OGPM Build URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Build URL.vi"/>
			<Item Name="Package Event Type -- Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI APIs/Packages/Package Event Type -- Enum.ctl"/>
			<Item Name="VIPM - Get Machine Name.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Get Machine Name.vi"/>
			<Item Name="VIPM - Get Installation ID.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Get Installation ID.vi"/>
			<Item Name="NI HTTP -- GET -- JKI VIPM.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/HTTP/NI HTTP -- GET -- JKI VIPM.vi"/>
			<Item Name="Config Encode String as Hex.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Config File/_Config Checksum - Support/Config Encode String as Hex.vi"/>
			<Item Name="OGPM URL Special Characters Constant.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM URL Special Characters Constant.vi"/>
			<Item Name="OGPM Decode URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Decode URL.vi"/>
			<Item Name="OGPM Encode URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Encode URL.vi"/>
			<Item Name="Target Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI APIs/_Support/Target Info Cluster.ctl"/>
			<Item Name="Search Results -- Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI APIs/_Support/Search Results -- Cluster.ctl"/>
			<Item Name="Check is Connected to the Internet.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Networking/Check is Connected to the Internet.vi"/>
			<Item Name="VIPM Get Built Status.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Built Status.vi"/>
			<Item Name="jki-api-constants.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/jki-api-constants.vi"/>
			<Item Name="VIPM Windows Machine Name from Registry.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Windows Machine Name from Registry.vi"/>
			<Item Name="VIPM Read Windows Registry Key.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Read Windows Registry Key.vi"/>
			<Item Name="user32" Type="VI" URL="user32">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="OGPM Move File into Cache.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Move File into Cache.vi"/>
			<Item Name="OGPM Build Pre-Release Version Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Build Pre-Release Version Array.vi"/>
			<Item Name="OGPM Version Comparison Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Version Comparison Enum.ctl"/>
			<Item Name="OGPM Compare Version Arrays.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Compare Version Arrays.vi"/>
			<Item Name="OGPM Compare Package Versions.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Compare Package Versions.vi"/>
			<Item Name="OGPM List Cached Spec Files.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM List Cached Spec Files.vi"/>
			<Item Name="OGPM PkgDir Append URL if Relative.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir Append URL if Relative.vi"/>
			<Item Name="OGPM PkgDir Package Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Type Definitions/OGPM PkgDir Package Info Cluster.ctl"/>
			<Item Name="OGPM PkgDir Expand Package URLs.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir Expand Package URLs.vi"/>
			<Item Name="OGPM Sort String Array by First Matched Integer.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Array Utilities/OGPM Sort String Array by First Matched Integer.vi"/>
			<Item Name="VIPM 2 Remove Quotes.vi" Type="VI" URL="../../../vipm-desktop/source/Main/custom config read/VIPM 2 Remove Quotes.vi"/>
			<Item Name="VIPM2 Parse Key Value Pair.vi" Type="VI" URL="../../../vipm-desktop/source/Main/custom config read/VIPM2 Parse Key Value Pair.vi"/>
			<Item Name="VIPM2 Read Config Contents.vi" Type="VI" URL="../../../vipm-desktop/source/Main/custom config read/VIPM2 Read Config Contents.vi"/>
			<Item Name="VIPM2 Unescape String.vi" Type="VI" URL="../../../vipm-desktop/source/Main/custom config read/VIPM2 Unescape String.vi"/>
			<Item Name="OGPM Filter Array by Match Pattern.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Array Utilities/OGPM Filter Array by Match Pattern.vi"/>
			<Item Name="VIPM2 Read Boolean Value.vi" Type="VI" URL="../../../vipm-desktop/source/Main/custom config read/VIPM2 Read Boolean Value.vi"/>
			<Item Name="VIPM2 Read String Value.vi" Type="VI" URL="../../../vipm-desktop/source/Main/custom config read/VIPM2 Read String Value.vi"/>
			<Item Name="VIPM2 PkgDir Read Item URLs from Config File.vi" Type="VI" URL="../../../vipm-desktop/source/Main/custom config read/VIPM2 PkgDir Read Item URLs from Config File.vi"/>
			<Item Name="OGPM PkgDir Util Get Packages Info from INI.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir Util Get Packages Info from INI.vi"/>
			<Item Name="OGPM PkgDir Directory Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Type Definitions/OGPM PkgDir Directory Info Cluster.ctl"/>
			<Item Name="OGPM PkgDir Util Get Directories Info from INI.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir Util Get Directories Info from INI.vi"/>
			<Item Name="VIPM lvtn repo base URL constant.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM lvtn repo base URL constant.vi"/>
			<Item Name="VIPM JKI VIPN repo base URL constant.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM JKI VIPN repo base URL constant.vi"/>
			<Item Name="OGPM PkgDir Get Public Package Directories.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM PkgDir Get Public Package Directories.vi"/>
			<Item Name="VIPM Globals.vi" Type="VI" URL="../../../vipm-desktop/source/Main/globals/VIPM Globals.vi"/>
			<Item Name="VIPM Split Version Number and Name.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Split Version Number and Name.vi"/>
			<Item Name="VIPM Get Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Version.vi"/>
			<Item Name="VIPM Get Version String for Display.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Version String for Display.vi"/>
			<Item Name="Registry Registration Info.ctl" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Custom Controls/Registry Registration Info.ctl"/>
			<Item Name="VIPM - Validation Details - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Validation Details - Enum.ctl"/>
			<Item Name="VIPM - Product Code Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Product Code Enum.ctl"/>
			<Item Name="VIPM - Product Code Info - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Product Code Info - Cluster.ctl"/>
			<Item Name="VIPM - Activation Data- Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Activation Data- Cluster.ctl"/>
			<Item Name="VIPM - Create Activation Queue Name and Type.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Create Activation Queue Name and Type.vi"/>
			<Item Name="VIPM - Create Activation Queue.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Create Activation Queue.vi"/>
			<Item Name="VIPM - Get Activation Info.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Get Activation Info.vi"/>
			<Item Name="OGPM PkgDir Directory Self Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Type Definitions/OGPM PkgDir Directory Self Info Cluster.ctl"/>
			<Item Name="OGPM PkgDir Util Get Directory Self Info from INI.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir Util Get Directory Self Info from INI.vi"/>
			<Item Name="Repository.lvlib" Type="Library" URL="../../../vipm-desktop/source/Repository Manger/Repository.lvlib"/>
			<Item Name="OGPM PkgDir Package Directory Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Type Definitions/OGPM PkgDir Package Directory Cluster.ctl"/>
			<Item Name="OGPM PkgDir Read Package Directory File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM PkgDir Read Package Directory File.vi"/>
			<Item Name="VIPM API main window queue datatype.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM API main window queue datatype.ctl"/>
			<Item Name="Read Abort Status from Queue.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Abort Class/Read Abort Status from Queue.vi"/>
			<Item Name="OGPM Offset and Range Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Messaging/OGPM Offset and Range Cluster.ctl"/>
			<Item Name="OGPM Status Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Messaging/OGPM Status Cluster.ctl"/>
			<Item Name="Abort Get Abort Status.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Abort Class/Abort Get Abort Status.vi"/>
			<Item Name="OGPM PkgDir Util Local or UNC File URL to Path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir Util Local or UNC File URL to Path.vi"/>
			<Item Name="OGPM Get File URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/Get URL Type Handlers/OGPM Get File URL.vi"/>
			<Item Name="OGPM http authentication info cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http authentication info cluster.ctl"/>
			<Item Name="OGPM http - Password Manager - Write.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http - Password Manager - Write.vi"/>
			<Item Name="OGPM http data store task enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http data store task enum.ctl"/>
			<Item Name="OGPM http data store.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http data store.vi"/>
			<Item Name="Encode Data to Hex.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Data Manipulation/Encode Data to Hex.vi"/>
			<Item Name="Blowfish F(X).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Crypto/LabVIEW Blowfish Encryption.llb/Blowfish F(X).vi"/>
			<Item Name="Blowfish Encipher Decipher.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Crypto/LabVIEW Blowfish Encryption.llb/Blowfish Encipher Decipher.vi"/>
			<Item Name="Blowfish Init.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Crypto/LabVIEW Blowfish Encryption.llb/Blowfish Init.vi"/>
			<Item Name="LabVIEW Blowfish Encryption.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Crypto/LabVIEW Blowfish Encryption.llb/LabVIEW Blowfish Encryption.vi"/>
			<Item Name="Decode Data from Hex.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Data Manipulation/Decode Data from Hex.vi"/>
			<Item Name="OGPM Crypto.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Crypto/OGPM Crypto.vi"/>
			<Item Name="JKI Open URL In Browser.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Open URL in Browser/JKI Open URL In Browser.vi"/>
			<Item Name="VIPM Launch Help.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Help/VIPM Launch Help.vi"/>
			<Item Name="VIPM Get Root Path.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Root Path.vi"/>
			<Item Name="VIPM App Data Folder.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM App Data Folder.vi"/>
			<Item Name="VIPM - VIPM Is Running File Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/OGC Install Core/VIPM - VIPM Is Running File Name.vi"/>
			<Item Name="VIPM Create Dir if Non-Existant.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/VIPM Create Dir if Non-Existant.vi"/>
			<Item Name="VIPM Paths.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Paths.ctl"/>
			<Item Name="VIPM Init Paths.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Init Paths.vi"/>
			<Item Name="VIPM Help Section Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Help Section Enum.ctl"/>
			<Item Name="VIPM Call Help.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Help/VIPM Call Help.vi"/>
			<Item Name="VIPM All Main UI - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM All Main UI - Enum.ctl"/>
			<Item Name="VIPM Center Panel Reference Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Center Panel Reference Enum.ctl"/>
			<Item Name="VIPM Center Panel.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Center Panel.vi"/>
			<Item Name="VIPM Help.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Help.ctl"/>
			<Item Name="VIPM Cancel Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Cancel Button.ctl"/>
			<Item Name="VIPM OK Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM OK Button.ctl"/>
			<Item Name="OGPM Authenticate Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM Authenticate Dialog.vi"/>
			<Item Name="OGPM Parse HTTP URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM Parse HTTP URL.vi"/>
			<Item Name="OGPM Parse Header.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM Parse Header.vi"/>
			<Item Name="OGPM Parse Recieved Data.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM Parse Recieved Data.vi"/>
			<Item Name="OGPM Status Message Type Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Messaging/OGPM Status Message Type Enum.ctl"/>
			<Item Name="OGPM Send Status Message.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Messaging/OGPM Send Status Message.vi"/>
			<Item Name="OGPM http Filter Connect Closed Error.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http Filter Connect Closed Error.vi"/>
			<Item Name="OGC - compatOverwrite.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Compatibility/OGC - compatOverwrite.vi"/>
			<Item Name="OGPM http Base64.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/OGPM http Base64.vi"/>
			<Item Name="OGPM http proxy info cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http proxy info cluster.ctl"/>
			<Item Name="format basic proxy authorization.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/format basic proxy authorization.vi"/>
			<Item Name="format basic authorization.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/format basic authorization.vi"/>
			<Item Name="Generate VIPM User Agent Data.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/Generate VIPM User Agent Data.vi"/>
			<Item Name="OGPM http Get Document.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http Get Document.vi"/>
			<Item Name="OGPM http Use Wininet.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http Use Wininet.vi"/>
			<Item Name="OGPM http - Password Manager - Read.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http - Password Manager - Read.vi"/>
			<Item Name="OGPM http Get Document (Password Manager).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http Get Document (Password Manager).vi"/>
			<Item Name="OGPM Send Progress Message.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Messaging/OGPM Send Progress Message.vi"/>
			<Item Name="OGPM http Get Status.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http Get Status.vi"/>
			<Item Name="OGPM http Abort Transfer.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM http Abort Transfer.vi"/>
			<Item Name="VIPM - Pad Version Level - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM - Pad Version Level - Enum.ctl"/>
			<Item Name="VIPM Pad Version String.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Pad Version String.vi"/>
			<Item Name="VIPM Installer Get Version String for Display.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/misc/VIPM Installer Get Version String for Display.vi"/>
			<Item Name="VIPM 30day Trial.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Update/VIPM 30day Trial.vi"/>
			<Item Name="CGI Unescape HTTP Param-JKI.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/CGI Unescape HTTP Param-JKI.vi"/>
			<Item Name="Get Product Section Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Get Product Section Name.vi"/>
			<Item Name="Get Registry Path.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Get Registry Path.vi"/>
			<Item Name="Get Registration Info.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Get Registration Info.vi"/>
			<Item Name="VIPM - VIPM URL - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM - VIPM URL - Enum.ctl"/>
			<Item Name="VIPM - Get VIPM URL.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM - Get VIPM URL.vi"/>
			<Item Name="OGPM Convert SourceForge URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Convert SourceForge URL.vi"/>
			<Item Name="OGPM Convert SourceForge URLs.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Convert SourceForge URLs.vi"/>
			<Item Name="OGPM Internet Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Internet Info Cluster.ctl"/>
			<Item Name="OGPM Download URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/OGPM Download URL.vi"/>
			<Item Name="OGPM Strip URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Strip URL.vi"/>
			<Item Name="OGPM Download URL to Cache.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Download URL to Cache.vi"/>
			<Item Name="OGPM PkgDir URL to Cached File Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM PkgDir URL to Cached File Name.vi"/>
			<Item Name="VIRM License Packs Data Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Data Structures/VIRM License Packs Data Cluster.ctl"/>
			<Item Name="VIRM Authorized Clients Data Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Data Structures/VIRM Authorized Clients Data Cluster.ctl"/>
			<Item Name="VIRM Private Data - RSS - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Data Structures/VIRM Private Data - RSS - Cluster.ctl"/>
			<Item Name="VIRM RSS Channel Item - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/RSS/VIRM RSS Channel Item - Cluster.ctl"/>
			<Item Name="VIRM Package Map.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Private/VIRM Package Map.ctl"/>
			<Item Name="VIRM Repository Properties Subset - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Data Structures/VIRM Repository Properties Subset - Cluster.ctl"/>
			<Item Name="OGPM Package Spec.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package Spec.ctl"/>
			<Item Name="OGPM Spec - Package - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec - Package - Cluster.ctl"/>
			<Item Name="OGPM Package File Type - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Package File Type - Enum.ctl"/>
			<Item Name="OGPM Package Spec Platform.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package Spec Platform.ctl"/>
			<Item Name="OGPM OS-LV Dependency Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM OS-LV Dependency Cluster.ctl"/>
			<Item Name="OGPM Package - File Group - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package - File Group - Cluster.ctl"/>
			<Item Name="OGPM Spec - Description - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec - Description - Cluster.ctl"/>
			<Item Name="OGPM Package - Files - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package - Files - Cluster.ctl"/>
			<Item Name="OGPM Package Spec Script VIs.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package Spec Script VIs.ctl"/>
			<Item Name="OGPM Package Spec Dependencies.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package Spec Dependencies.ctl"/>
			<Item Name="OGPM Package Dependency Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package Dependency Cluster.ctl"/>
			<Item Name="OGPM Package - License and Activation Files - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Package - License and Activation Files - Cluster.ctl"/>
			<Item Name="OGPM LabVIEW Spec Section Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM LabVIEW Spec Section Cluster.ctl"/>
			<Item Name="VIPM - GUID.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - GUID.vi"/>
			<Item Name="VIPM - User Data - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - User Data - Cluster.ctl"/>
			<Item Name="VIPM - Activation Dates - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Activation Dates - Cluster.ctl"/>
			<Item Name="Write to RSS File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/RSS/Write to RSS File.vi"/>
			<Item Name="VIRM RSS Channel - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/RSS/VIRM RSS Channel - Cluster.ctl"/>
			<Item Name="VIRM RSS - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/RSS/VIRM RSS - Cluster.ctl"/>
			<Item Name="USER32.DLL" Type="Document" URL="USER32.DLL">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Parse rfc 822 Datetime String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/RSS/Parse rfc 822 Datetime String.vi"/>
			<Item Name="OGPM Read Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Spec File.vi"/>
			<Item Name="OGPM Read Files from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Files from Spec File.vi"/>
			<Item Name="OGPM Read Package Name from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Package Name from Spec File.vi"/>
			<Item Name="OGPM Spec - Package Name - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec - Package Name - Cluster.ctl"/>
			<Item Name="OGPM Read Platform from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Platform from Spec File.vi"/>
			<Item Name="OGPM Convert LabVIEW Dependancy String to Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Convert LabVIEW Dependancy String to Cluster.vi"/>
			<Item Name="OGPM Convert Compatiblility String to Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Convert Compatiblility String to Cluster.vi"/>
			<Item Name="OGPM Convert OS Dependancy String to Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Convert OS Dependancy String to Cluster.vi"/>
			<Item Name="OGPM Read Description from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Description from Spec File.vi"/>
			<Item Name="OGPM Read Files Groups from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Files Groups from Spec File.vi"/>
			<Item Name="OGPM Read Files Groups Flat Elements from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Files Groups Flat Elements from Spec File.vi"/>
			<Item Name="OGPM Spec- Dummy File Group Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec- Dummy File Group Cluster.vi"/>
			<Item Name="OGPM Comma Delimited List to Array (and Trim Whitespace).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Comma Delimited List to Array (and Trim Whitespace).vi"/>
			<Item Name="OGPM Spec- Dummy Spec Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec- Dummy Spec Cluster.vi"/>
			<Item Name="OGPM Read Script VIs from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Script VIs from Spec File.vi"/>
			<Item Name="OGPM Read Dependencies from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Dependencies from Spec File.vi"/>
			<Item Name="OGPM Convert Dependancy String to Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Convert Dependancy String to Cluster.vi"/>
			<Item Name="OGPM Spec- Dummy Dependencies Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec- Dummy Dependencies Cluster.vi"/>
			<Item Name="OGPM Read Package Section from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Package Section from Spec File.vi"/>
			<Item Name="OGPM Read Activation from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Activation from Spec File.vi"/>
			<Item Name="OGPM Read LabVIEW section from Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read LabVIEW section from Spec File.vi"/>
			<Item Name="OGPM Class.lvlib" Type="Library" URL="../../../vipm-desktop/source/OGPM/OGPM Class.lvlib"/>
			<Item Name="OGPM Packages Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Packages Info Cluster.ctl"/>
			<Item Name="OGPM Package Cached State.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Package Cached State.ctl"/>
			<Item Name="OGPM Constants Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Constants Cluster.ctl"/>
			<Item Name="OGPM Options Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Options Cluster.ctl"/>
			<Item Name="OGPM Target Settings Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Target Settings Cluster.ctl"/>
			<Item Name="OGPM Object RefNum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Object RefNum.ctl"/>
			<Item Name="OGPM Object RefNum - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Object RefNum - Enum.ctl"/>
			<Item Name="OGPM Object Data Core Task Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Object Data Core Task Enum.ctl"/>
			<Item Name="OGPM Lookup Package Spec from Packages Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Lookup Package Spec from Packages Info Array.vi"/>
			<Item Name="Search 1D Array (Check Cached Value).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Array/Search 1D Array (Check Cached Value).vi"/>
			<Item Name="OGPM Draw Image from File__ogtk.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/OGPM Draw Image from File__ogtk.vi"/>
			<Item Name="OGPM Lookup Package State from Packages Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Lookup Package State from Packages Info Array.vi"/>
			<Item Name="OGPM Get Cached Package Path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM Get Cached Package Path.vi"/>
			<Item Name="OGPM Get Package Cached State.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM Get Package Cached State.vi"/>
			<Item Name="OGPM List Cached Packages.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM List Cached Packages.vi"/>
			<Item Name="OGPM Find Package in Packages Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Find Package in Packages Array.vi"/>
			<Item Name="OGPM Version Array to String.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Version Array to String.vi"/>
			<Item Name="Shell32.dll" Type="Document" URL="Shell32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Create Mac Directory with Permissions.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/Create Mac Directory with Permissions.vi"/>
			<Item Name="VIPM Run AppleScript Code.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/VIPM Run AppleScript Code.vi"/>
			<Item Name="VIPM Format File Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Format File Version.vi"/>
			<Item Name="Get Installation Info.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Get Installation Info.vi"/>
			<Item Name="Registry Installation Info.ctl" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Custom Controls/Registry Installation Info.ctl"/>
			<Item Name="Read Installation Info SubVI.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Read Installation Info SubVI.vi"/>
			<Item Name="OGC product info.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/misc/OGC product info.vi"/>
			<Item Name="product info - cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/misc/controls/product info - cluster -.ctl"/>
			<Item Name="VIPM WindowsNT Version from Registry.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM WindowsNT Version from Registry.vi"/>
			<Item Name="JKI Get Web Browser Path.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Open URL in Browser/JKI Get Web Browser Path.vi"/>
			<Item Name="JKI Get System Web Browser.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Open URL in Browser/JKI Get System Web Browser.vi"/>
			<Item Name="JKI Prompt Web Browser Path.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Open URL in Browser/JKI Prompt Web Browser Path.vi"/>
			<Item Name="VIPM Wrap Text for Dialogs.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Wrap Text for Dialogs.vi"/>
			<Item Name="VIPM Titlebar Mod.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Titlebar Mod.vi"/>
			<Item Name="Wininet HTTP Get.vi" Type="VI" URL="../../../vipm-desktop/source/Wininet/Wininet HTTP Get.vi"/>
			<Item Name="WinInet Initialize.vi" Type="VI" URL="../../../vipm-desktop/source/Wininet/WinInet Initialize.vi"/>
			<Item Name="dwAccess Type Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Wininet/dwAccess Type Enum.ctl"/>
			<Item Name="Wininet Insert Win32 API Error.vi" Type="VI" URL="../../../vipm-desktop/source/Wininet/Wininet Insert Win32 API Error.vi"/>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Wininet.dll" Type="Document" URL="Wininet.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="WinInet Close Handle.vi" Type="VI" URL="../../../vipm-desktop/source/Wininet/WinInet Close Handle.vi"/>
			<Item Name="WinInet Get URL.vi" Type="VI" URL="../../../vipm-desktop/source/Wininet/WinInet Get URL.vi"/>
			<Item Name="WinInet Query Info.vi" Type="VI" URL="../../../vipm-desktop/source/Wininet/WinInet Query Info.vi"/>
			<Item Name="Directory Info - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/Custom Controls/Directory Info - Cluster -.ctl"/>
			<Item Name="OGPM Read from Root Directory.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM Read from Root Directory.vi"/>
			<Item Name="OGPM Write to Root Directory.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/Utilities/OGPM Write to Root Directory.vi"/>
			<Item Name="Get Active Project Folder.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Install into Project Folder/Get Active Project Folder.vi"/>
			<Item Name="lv-venv.lvclass" Type="LVClass" URL="../../../vipm-desktop/source/ProjectDragon/source/lv-venv/lv-venv.lvclass"/>
			<Item Name="dotVIPM - LabVIEW Bitness - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/dotVIPM - LabVIEW Bitness - Enum.ctl"/>
			<Item Name="DragonProject.lvclass" Type="LVClass" URL="../../../vipm-desktop/source/ProjectDragon/source/DragonProject/DragonProject.lvclass"/>
			<Item Name="Project Info -- Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/ProjectDragon/source/DragonProject/Project Info -- Cluster.ctl"/>
			<Item Name="Window.lvclass" Type="LVClass" URL="../../../vipm-desktop/source/JKI Reuse Pool/Window API/source/Window.lvclass"/>
			<Item Name="Win32 Handle (hwnd).ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Window API/source/Typedefs/Win32 Handle (hwnd).ctl"/>
			<Item Name="Set Window EXStyle.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Set Window EXStyle.vi"/>
			<Item Name="Modify Window Style.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Modify Window Style.vi"/>
			<Item Name="Get Window GWL_ExStyle.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Get Window GWL_ExStyle.vi"/>
			<Item Name="User32.dll" Type="Document" URL="User32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Set Window GWL_ExStyle.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Set Window GWL_ExStyle.vi"/>
			<Item Name="Allow Window Resize.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Allow Window Resize.vi"/>
			<Item Name="Get Window GWL_Style.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Get Window GWL_Style.vi"/>
			<Item Name="Set Window GWL_Style.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Set Window GWL_Style.vi"/>
			<Item Name="Window Size - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Window API/source/Typedefs/Window Size - Cluster.ctl"/>
			<Item Name="VIPM generate string buffer.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM generate string buffer.vi"/>
			<Item Name="HWIND - Set Windows Topmost Floating.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Snap Windows/HWIND - Set Windows Topmost Floating.vi"/>
			<Item Name="HWIND - Cancel Window Topmost Floating.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Snap Windows/HWIND - Cancel Window Topmost Floating.vi"/>
			<Item Name="HWIND - Is Window Floating Topmost.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Snap Windows/HWIND - Is Window Floating Topmost.vi"/>
			<Item Name="VIPM - Windows Process ID to Application Path.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM - Windows Process ID to Application Path.vi"/>
			<Item Name="psapi.dll" Type="Document" URL="psapi.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="VIPM - Windows Window Handle to Process ID.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM - Windows Window Handle to Process ID.vi"/>
			<Item Name="PCE API.lvlib" Type="Library" URL="../../../vipm-desktop/source/Main/PCE API/PCE API.lvlib"/>
			<Item Name="PCE File Class.lvlib" Type="Library" URL="../../../vipm-desktop/source/Main/PCE Support/PCE File Class/PCE File Class.lvlib"/>
			<Item Name="PCE Project XML - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Project XML - Cluster.ctl"/>
			<Item Name="PCE Project XML attributes - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Project XML attributes - Cluster.ctl"/>
			<Item Name="PCE Config File Package Attributes Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Config File Package Attributes Cluster.ctl"/>
			<Item Name="Check File Read Only.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Check File Read Only.vi"/>
			<Item Name="VIPM R-W Text File.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM R-W Text File.vi"/>
			<Item Name="VIPM File Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM File Dialog.vi"/>
			<Item Name="VIPM File Exists.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM File Exists.vi"/>
			<Item Name="PCE Read Write Config File Mode - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Read Write Config File Mode - Enum.ctl"/>
			<Item Name="OGPM Convert Status Queue Offset and Range for Subtask.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Convert Status Queue Offset and Range for Subtask.vi"/>
			<Item Name="OGPM Convert Offset and Range for Subtask.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Convert Offset and Range for Subtask.vi"/>
			<Item Name="OGPM Get Iteration Progress.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Get Iteration Progress.vi"/>
			<Item Name="Command-Line Zip.lvlib" Type="Library" URL="../../../vipm-desktop/source/submodules/labview-command-line-zip-tools/source/Command-Line Zip.lvlib"/>
			<Item Name="ZipCross Open Zip Archive.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Open Zip Archive.vi"/>
			<Item Name="ZipDotNet.lvlib" Type="Library" URL="../../../vipm-desktop/source/JKI Reuse Pool/Zip dotNet/ZipDotNet.lvlib"/>
			<Item Name="System.IO.Compression.FileSystem" Type="Document" URL="System.IO.Compression.FileSystem">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="System.IO.Compression" Type="Document" URL="System.IO.Compression">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="mscorlib" Type="VI" URL="mscorlib">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="ZipCross Close Zip Archive.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Close Zip Archive.vi"/>
			<Item Name="ZipCross Store File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Store File.vi"/>
			<Item Name="ZipCross Open Unzip Archive.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Open Unzip Archive.vi"/>
			<Item Name="ZipCross Close Unzip Archive.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Close Unzip Archive.vi"/>
			<Item Name="ZipCross Enumerate File Contents.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Enumerate File Contents.vi"/>
			<Item Name="ZipCross Extract Stream.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Extract Stream.vi"/>
			<Item Name="ZipCross Copy Raw File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Copy Raw File.vi"/>
			<Item Name="OGPM Lookup Package Remote Info from Packages Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Lookup Package Remote Info from Packages Info Array.vi"/>
			<Item Name="OGPM Update Mirrors List.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM Update Mirrors List.vi"/>
			<Item Name="OGPM SF Mirror Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/Type Definitions/OGPM SF Mirror Cluster.ctl"/>
			<Item Name="OGPM SFMirrors Convert Mirror Cluster to String.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM SFMirrors Convert Mirror Cluster to String.vi"/>
			<Item Name="OGPM SFMirrors Convert Mirror String to Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM SFMirrors Convert Mirror String to Cluster.vi"/>
			<Item Name="OGPM Download Mirrors List.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM Download Mirrors List.vi"/>
			<Item Name="OGPM SFMirrors Get SF Mirrors from File String.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM SFMirrors Get SF Mirrors from File String.vi"/>
			<Item Name="OGPM SFMirrors Read SF Mirrors from File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM SFMirrors Read SF Mirrors from File.vi"/>
			<Item Name="OGPM SFMirrors Write Mirrors to File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM SFMirrors Write Mirrors to File.vi"/>
			<Item Name="Options.lvlib" Type="Library" URL="../../../vipm-desktop/source/Main/Options Class/Options.lvlib"/>
			<Item Name="LabVIEW Version String to Two-Digit Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/LabVIEW Version String to Two-Digit Version.vi"/>
			<Item Name="VIPM Targets.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Targets.ctl"/>
			<Item Name="VIPM Active Target.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Active Target.ctl"/>
			<Item Name="VIPM General Settings.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Controls/VIPM General Settings.ctl"/>
			<Item Name="VIPM quick filter settings.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Filters/TypeDef/VIPM quick filter settings.ctl"/>
			<Item Name="PCE Settings Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Settings Cluster.ctl"/>
			<Item Name="VIPM Window Positions.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Window Positions.ctl"/>
			<Item Name="VIPM Window Bounds.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Window Bounds.ctl"/>
			<Item Name="VIPB_API.All Persistent Settings - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.All Persistent Settings - Cluster -.ctl"/>
			<Item Name="VIPB_API.Last Build Persistent Settings - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Last Build Persistent Settings - Cluster -.ctl"/>
			<Item Name="VIPB - Regenerate Icons and Palettes - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Regenerate Icons and Palettes - Enum -.ctl"/>
			<Item Name="VIPB - Tri State Dialog - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Tri State Dialog - Enum -.ctl"/>
			<Item Name="VIPM Preview Feature Settings.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Controls/VIPM Preview Feature Settings.ctl"/>
			<Item Name="VIPM Preview Feature.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Controls/VIPM Preview Feature.ctl"/>
			<Item Name="VIPM Preview Feature Type.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Controls/VIPM Preview Feature Type.ctl"/>
			<Item Name="Default - Options Feature Flags.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Controls/Default - Options Feature Flags.vi"/>
			<Item Name="VIPM Valid Target Check.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/VIPM Valid Target Check.vi"/>
			<Item Name="VIPM RW Options INI Mode.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Controls/VIPM RW Options INI Mode.ctl"/>
			<Item Name="VIPM LabVIEW Versions.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Controls/VIPM LabVIEW Versions.ctl"/>
			<Item Name="VIPM convert lv version to app version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM convert lv version to app version.vi"/>
			<Item Name="OGPM Compare LabVIEW Versions.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/OGPM Compare LabVIEW Versions.vi"/>
			<Item Name="LabVIEW Version String to Version Year.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/LabVIEW Version String to Version Year.vi"/>
			<Item Name="VIPM Add 64-bit Suffix to LabVIEW Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/support/VIPM Add 64-bit Suffix to LabVIEW Version.vi"/>
			<Item Name="VIPM Add-Remove Stub.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/Misc. Utilities/VIPM Add-Remove Stub.vi"/>
			<Item Name="VIPM Add Remove Target Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/controls/VIPM Add Remove Target Enum.ctl"/>
			<Item Name="VIPM Write Characters to File - With Error in and Error Out - .vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/Misc. Utilities/VIPM Write Characters to File - With Error in and Error Out - .vi"/>
			<Item Name="App.ReadLabVIEWVIServerSettings.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Utility/App.ReadLabVIEWVIServerSettings.vi"/>
			<Item Name="App.LabVIEW TCP Settings - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Utility/App.LabVIEW TCP Settings - Cluster.ctl"/>
			<Item Name="App.LabVIEW TCP Settings - Access Rule - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Utility/App.LabVIEW TCP Settings - Access Rule - Cluster.ctl"/>
			<Item Name="App.LabVIEW TCP Settings - Access Rule - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Utility/App.LabVIEW TCP Settings - Access Rule - Enum.ctl"/>
			<Item Name="VIPM Get Linux LabVIEW Prefs Path.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/VIPM Get Linux LabVIEW Prefs Path.vi"/>
			<Item Name="SimpleConfig - Read Key - U32.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Read Key - U32.vi"/>
			<Item Name="SimpleConfig - Get Key Line.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Get Key Line.vi"/>
			<Item Name="SimpleConfig - Get Value from Line.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Get Value from Line.vi"/>
			<Item Name="SimpleConfig - Remove Quotes from String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Remove Quotes from String.vi"/>
			<Item Name="SimpleConfig - Read Key - String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Read Key - String.vi"/>
			<Item Name="SimpleConfig - Read Key - Boolean.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Read Key - Boolean.vi"/>
			<Item Name="VIPM Get Mac LabVIEW Prefs Path.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/VIPM Get Mac LabVIEW Prefs Path.vi"/>
			<Item Name="VIPM LabVIEW Version to Marketing Version String.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM LabVIEW Version to Marketing Version String.vi"/>
			<Item Name="Get Version of labview app.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/Get Version of labview app.vi"/>
			<Item Name="VIPM - Get Installed LabVIEW Versions - Cross-Platform.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM - Get Installed LabVIEW Versions - Cross-Platform.vi"/>
			<Item Name="VIPM Get Installed LabVIEW Versions for Linux.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/VIPM Get Installed LabVIEW Versions for Linux.vi"/>
			<Item Name="Find LabVIEW Executable Info from Install Folder.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/Find LabVIEW Executable Info from Install Folder.vi"/>
			<Item Name="Linux - Get LabVIEW Version from LabVIEW Installed Folder Name.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/Linux - Get LabVIEW Version from LabVIEW Installed Folder Name.vi"/>
			<Item Name="VIPM Get Installed LabVIEW Versions from Registry.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Get Installed LabVIEW Versions from Registry.vi"/>
			<Item Name="Test for 64-bit Windows.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Test for 64-bit Windows.vi"/>
			<Item Name="Check is LabVIEW Community Edition.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Check LabVIEW Community Edition/Check is LabVIEW Community Edition.vi"/>
			<Item Name="VIPM Get Installed LabVIEW Versions for Mac.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/VIPM Get Installed LabVIEW Versions for Mac.vi"/>
			<Item Name="Options Set LabVIEW Target if Empty -- Enum Mode.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Support/Options Set LabVIEW Target if Empty -- Enum Mode.vi"/>
			<Item Name="VIRM Close VIRM.vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Support/VIRM Close VIRM.vi"/>
			<Item Name="OGPM PkgDir Read Item URLs from Config File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM PkgDir Read Item URLs from Config File.vi"/>
			<Item Name="VIRM Private Data - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Data Structures/VIRM Private Data - Cluster.ctl"/>
			<Item Name="VIPB - Use Default if Empty.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Use Default if Empty.vi"/>
			<Item Name="OGPM Get Spec from Pkg File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Get Spec from Pkg File.vi"/>
			<Item Name="OGPM Error Codes.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Error Codes.ctl"/>
			<Item Name="OGPM Build Error Cluster (OGPM Codes).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Build Error Cluster (OGPM Codes).vi"/>
			<Item Name="OGPM Extract Spec from Pkg to Temp Dir.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Extract Spec from Pkg to Temp Dir.vi"/>
			<Item Name="ZipCross Extract File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Extract File.vi"/>
			<Item Name="OGPM Read Spec File (Smart).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Spec File (Smart).vi"/>
			<Item Name="OGPM Read Spec File from Datalog file.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Spec File from Datalog file.vi"/>
			<Item Name="OGPM Read Spec File (Smart-Jim).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Read Spec File (Smart-Jim).vi"/>
			<Item Name="OGPM Get Record Number from Spec Summary Data.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Get Record Number from Spec Summary Data.vi"/>
			<Item Name="OGPM Get Spec File Last Modify String.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Get Spec File Last Modify String.vi"/>
			<Item Name="OGPM add Spec File to Datalog file.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM add Spec File to Datalog file.vi"/>
			<Item Name="OGPM Spec Summary Write.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec Summary Write.vi"/>
			<Item Name="OGPM Spec Summary Read.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Spec Summary Read.vi"/>
			<Item Name="OGPB SpecFile - Convert Compatibility to String__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Convert Compatibility to String__VIPB__OGB.vi"/>
			<Item Name="OGPB Version Array to-from String__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Version Array to-from String__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Convert OS Dependencies to String__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Convert OS Dependencies to String__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Convert Dependencies to String__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Convert Dependencies to String__VIPB__OGB.vi"/>
			<Item Name="VIPM Logger.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Logger.vi"/>
			<Item Name="Logging Global.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/Logging Global.vi"/>
			<Item Name="Create GUID (Cross-Platform).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/GUID/Create GUID (Cross-Platform).vi"/>
			<Item Name="VIPM - PRNG M Values.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/GUID/Create GUID (Cross-Platform) support/VIPM - PRNG M Values.vi"/>
			<Item Name="VIPM - DSA SHA 1 Modification.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/GUID/Create GUID (Cross-Platform) support/VIPM - DSA SHA 1 Modification.vi"/>
			<Item Name="VIPM - SHA 1 Message Padding.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/GUID/Create GUID (Cross-Platform) support/VIPM - SHA 1 Message Padding.vi"/>
			<Item Name="VIPM - SHA 1 Circular Left Shift.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/GUID/Create GUID (Cross-Platform) support/VIPM - SHA 1 Circular Left Shift.vi"/>
			<Item Name="Read-Write First Launch Flag.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/First Launch VIs/Read-Write First Launch Flag.vi"/>
			<Item Name="VIPM Installed LabVIEW Versions Registry Info - Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Installed LabVIEW Versions Registry Info - Cluster.vi"/>
			<Item Name="Listed LabVIEW Info - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Options UI Support/Listed LabVIEW Info - Cluster.ctl"/>
			<Item Name="VIPM Autosize Table Columns.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Autosize Table Columns.vi"/>
			<Item Name="VIPM fix listbox out of range.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM fix listbox out of range.vi"/>
			<Item Name="VIPM Configure LV Port.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/VIPM Configure LV Port.vi"/>
			<Item Name="VIPM Configure Port App Data Subvi.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/support/VIPM Configure Port App Data Subvi.vi"/>
			<Item Name="VIPM Configure Port - App Data.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/controls/VIPM Configure Port - App Data.ctl"/>
			<Item Name="App.Connect.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Public/App.Connect.vi"/>
			<Item Name="VIPM Launch Target.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Launch Target.vi"/>
			<Item Name="JKI Timeout.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Timing/JKI Timeout.vi"/>
			<Item Name="OGPM Version String to Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Version String to Array.vi"/>
			<Item Name="App.FilterConnectionError.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Utility/App.FilterConnectionError.vi"/>
			<Item Name="App.EnableVIServer.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Public/App.EnableVIServer.vi"/>
			<Item Name="App.WriteLabVIEWVIServerSettings.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/VI Server/Utility/App.WriteLabVIEWVIServerSettings.vi"/>
			<Item Name="SimpleConfig - Write Key - U32.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Write Key - U32.vi"/>
			<Item Name="SimpleConfig - Write Key - Boolean.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Write Key - Boolean.vi"/>
			<Item Name="SimpleConfig - Write Key - String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/SimpleConfig/SimpleConfig - Write Key - String.vi"/>
			<Item Name="VIPM Check VIServer Access.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Check VIServer Access.vi"/>
			<Item Name="VIPM Connection results.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Connection results.ctl"/>
			<Item Name="VIPM display message after connection verification.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/VIPM display message after connection verification.vi"/>
			<Item Name="VIPM Connect to LV Error Messages.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Connect to LV Error Messages.vi"/>
			<Item Name="Check LabVIEW is Closed with Timeout.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/support/Check LabVIEW is Closed with Timeout.vi"/>
			<Item Name="VIPM Get Please Wait Spinner.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Please Wait Spinner.vi"/>
			<Item Name="VIPM Is LabVIEW Running.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Is LabVIEW Running.vi"/>
			<Item Name="Check if Linux LabVIEW Running.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/Check if Linux LabVIEW Running.vi"/>
			<Item Name="Get Running Linux LabVIEW Processes.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/Get Running Linux LabVIEW Processes.vi"/>
			<Item Name="Get Linux Process List.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/Get Linux Process List.vi"/>
			<Item Name="VIPM winutil master.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM winutil master.vi"/>
			<Item Name="Get Running Mac Apps.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/Get Running Mac Apps.vi"/>
			<Item Name="Check is LabVIEW Running using pgrep.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/Check is LabVIEW Running using pgrep.vi"/>
			<Item Name="VIPM Quit Applications.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Quit Applications.vi"/>
			<Item Name="Kill Linux Process.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Linux/Kill Linux Process.vi"/>
			<Item Name="VIPM postmessage master.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM postmessage master.vi"/>
			<Item Name="VIPM window refnum.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM window refnum.ctl"/>
			<Item Name="Quit Mac App.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/Quit Mac App.vi"/>
			<Item Name="Check if Mac LabVIEW Running.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/Check if Mac LabVIEW Running.vi"/>
			<Item Name="Check Is Executable Running (by EXE Path).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Check Is Executable Running (by EXE Path).vi"/>
			<Item Name="fpopen logger.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/fpopen logger.vi"/>
			<Item Name="Move Window to Top.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Move Window to Top.vi"/>
			<Item Name="Bring Window to Front.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Bring Window to Front.vi"/>
			<Item Name="VIPM Color Rows.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Color Rows.vi"/>
			<Item Name="VIPM Configure Scrolbars.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Configure Scrolbars.vi"/>
			<Item Name="VIPM Create Tree Symbols.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Tree/VIPM Create Tree Symbols.vi"/>
			<Item Name="VIPM Find Target Index.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/VIPM Find Target Index.vi"/>
			<Item Name="Are Same Year and Bitness.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Are Same Year and Bitness.vi"/>
			<Item Name="VIPM Options PCE Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options PCE Button.ctl"/>
			<Item Name="VIRM Treat Repository URL.vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Support/VIRM Treat Repository URL.vi"/>
			<Item Name="VIPM handle PRO Feature call in community edition.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM handle PRO Feature call in community edition.vi"/>
			<Item Name="VIPM - First Launch Window.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM - First Launch Window.vi"/>
			<Item Name="First Launch - App Data.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/First Launch Support/First Launch - App Data.ctl"/>
			<Item Name="First launch Choice.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/First Launch Support/First launch Choice.ctl"/>
			<Item Name="First Launch - Tab State ENUM.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/First Launch Support/First Launch - Tab State ENUM.ctl"/>
			<Item Name="VIPM API URL Name.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM API URL Name.ctl"/>
			<Item Name="VIPM API Launch URL.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM API Launch URL.vi"/>
			<Item Name="JKI Open URL In Browser (Path).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Open URL in Browser/JKI Open URL In Browser (Path).vi"/>
			<Item Name="CGI Escape HTTP Param-JKI.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/CGI Escape HTTP Param-JKI.vi"/>
			<Item Name="First launch mode.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/First Launch Support/First launch mode.ctl"/>
			<Item Name="VIPM splash refnum global.vi" Type="VI" URL="../../../vipm-desktop/source/Main/globals/VIPM splash refnum global.vi"/>
			<Item Name="Get Text Decoration by Search String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Get Text Decoration by Search String.vi"/>
			<Item Name="VIPM - Validate Registration.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Validate Registration.vi"/>
			<Item Name="VIPM - Decode Serial Number.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Decode Serial Number.vi"/>
			<Item Name="VIPM - Split Serial Header from Hash.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Split Serial Header from Hash.vi"/>
			<Item Name="VIPM - Decode Product Code.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Decode Product Code.vi"/>
			<Item Name="VIPM - Decode Time.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Decode Time.vi"/>
			<Item Name="VIPM - Hashing Algorithm.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Hashing Algorithm.vi"/>
			<Item Name="VIPM - Create Serial Number.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Create Serial Number.vi"/>
			<Item Name="VIPM - Generate Product Code.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Generate Product Code.vi"/>
			<Item Name="VIPM - Format Edition Indicator with expiry.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Format Edition Indicator with expiry.vi"/>
			<Item Name="VIPM - Convert activation level to string display.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Convert activation level to string display.vi"/>
			<Item Name="Start Window Drag.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Start Window Drag.vi"/>
			<Item Name="Conditional State String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/JKI State Machine/Conditional State String.vi"/>
			<Item Name="VIPM - Set Non-Commercial User Status.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Set Non-Commercial User Status.vi"/>
			<Item Name="VIPM - Set Activation Info.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Set Activation Info.vi"/>
			<Item Name="Set Registration Info.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Set Registration Info.vi"/>
			<Item Name="Build State String with Arguments - Welcome Dialog Enum.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/JKI State Machine/Build State String with Arguments - Welcome Dialog Enum.vi"/>
			<Item Name="VIPM API Show Login Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/JKI APIs/VIPM API Show Login Dialog.vi"/>
			<Item Name="login-mode.ctl" Type="VI" URL="../../../vipm-desktop/source/Login Form/login-mode.ctl"/>
			<Item Name="MainUI.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/MainUI.vi"/>
			<Item Name="UI States.ctl" Type="VI" URL="../../../vipm-desktop/source/Login Form/UI States.ctl"/>
			<Item Name="Network Error.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/Network Error.vi"/>
			<Item Name="VIPM BringWindowToTop.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM BringWindowToTop.vi"/>
			<Item Name="VIPM Set Calling VI Wnd Top &amp; Active.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Set Calling VI Wnd Top &amp; Active.vi"/>
			<Item Name="Cancel Calling VI Wnd Topmost.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Cancel Calling VI Wnd Topmost.vi"/>
			<Item Name="Pkg Props.lvclass" Type="LVClass" URL="../../../vipm-desktop/source/Main/Package Properties Window/Pkg Props.lvclass"/>
			<Item Name="Package Properties SubPanel Queue Data.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/Package Properties SubPanel Queue Data.ctl"/>
			<Item Name="OGPB Construct Package Name__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Construct Package Name__VIPB__OGB.vi"/>
			<Item Name="OGPM Package Info Cluster Constant.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Package Info Cluster Constant.ctl"/>
			<Item Name="OGPM Package Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Package Info Cluster.ctl"/>
			<Item Name="Package Name From URL.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/Package Name From URL.vi"/>
			<Item Name="Package Name and Repo URL from VIPM URL.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/Package Name and Repo URL from VIPM URL.vi"/>
			<Item Name="VIPB - Find other versions of a package.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Find other versions of a package.vi"/>
			<Item Name="OGPM Construct Package Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Construct Package Name.vi"/>
			<Item Name="VIPM Get Examples and Palette from Spec.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Examples and Palette from Spec.vi"/>
			<Item Name="VIPB.lvclass" Type="LVClass" URL="../../../vipm-desktop/source/VI Package Builder/VIPB.lvclass"/>
			<Item Name="VIPB_API.LibraryGeneralSettings - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.LibraryGeneralSettings - Cluster.ctl"/>
			<Item Name="VIPB_API.Palette - View Format - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - View Format - Enum -.ctl"/>
			<Item Name="VIPB_API.Palette - Palette Size - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Palette Size - Cluster -.ctl"/>
			<Item Name="VIPB_API.Palette - Synchronization Info - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Synchronization Info - Cluster -.ctl"/>
			<Item Name="VIPB_API.Palette - Help Info - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Help Info - Cluster -.ctl"/>
			<Item Name="VIPB_API.Palette - Item Type - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Item Type - Enum -.ctl"/>
			<Item Name="VIPB_API.Palette - Item Position - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Item Position - Cluster -.ctl"/>
			<Item Name="VIPB_API.Palette - Item Data - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Item Data - Cluster -.ctl"/>
			<Item Name="VIPB_API.Palette - Data (Functions or Control) - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Data (Functions or Control) - Cluster -.ctl"/>
			<Item Name="VIPB_API.LibraryPaletteDefinition - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.LibraryPaletteDefinition - Cluster.ctl"/>
			<Item Name="VIPB_API.Dependencies - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Dependencies - Cluster.ctl"/>
			<Item Name="VIPB_API.Build Hooks - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Build Hooks - Cluster.ctl"/>
			<Item Name="VIPB_API.Description - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Description - Cluster.ctl"/>
			<Item Name="VIPB_API.VI Based Destination - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.VI Based Destination - Cluster.ctl"/>
			<Item Name="VIPB_API.Additional Destinations - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Controls/VIPB_API.Additional Destinations - Cluster.ctl"/>
			<Item Name="VIPB_API.Destinations - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Destinations - Cluster.ctl"/>
			<Item Name="VIPB_API.Non-VI Destination - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Non-VI Destination - Cluster.ctl"/>
			<Item Name="VIPB_API.Destination Overrides - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Destination Overrides - Cluster -.ctl"/>
			<Item Name="VIPB_API.Password Override - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Password Override - Cluster.ctl"/>
			<Item Name="VIPB_API.Source Files Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Source Files Cluster.ctl"/>
			<Item Name="VIPB_API.NameSpace Override - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.NameSpace Override - Cluster.ctl"/>
			<Item Name="VIPB - Namespace Type - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Namespace Type - Enum.ctl"/>
			<Item Name="VIPB_API.Exclusion - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Exclusion - Cluster.ctl"/>
			<Item Name="VIPB_API.AdvancedSettings - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.AdvancedSettings - Cluster.ctl"/>
			<Item Name="VIPB_API.License and Activation Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.License and Activation Cluster.ctl"/>
			<Item Name="VIPB_API.Palette Set - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette Set - Cluster.ctl"/>
			<Item Name="Palette Info Cluster (string).ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Category Finder/Palette Info Cluster (string).ctl"/>
			<Item Name="VIPB_API.Install_Requirements - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Install_Requirements - Cluster.ctl"/>
			<Item Name="VIPB_API.labviewsettings - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.labviewsettings - Cluster.ctl"/>
			<Item Name="VI Docs - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VI Docs - Cluster.ctl"/>
			<Item Name="VIPB_API.System Destinations - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.System Destinations - Cluster.ctl"/>
			<Item Name="VIPB_API.Additional System Destinations - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Controls/VIPB_API.Additional System Destinations - Cluster.ctl"/>
			<Item Name="VIPB_API.BuildSettings(Latest Version) - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.BuildSettings(Latest Version) - Cluster -.ctl"/>
			<Item Name="VIPB_API.Confirm Build Dialogs.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/VIPB_API.Confirm Build Dialogs.vi"/>
			<Item Name="VIPB_API.Scan&amp;ValidateSourceFolder.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Scan&amp;ValidateSourceFolder.vi"/>
			<Item Name="VIPB_API.ScanSourceFolder.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.ScanSourceFolder.vi"/>
			<Item Name="VIPB - Abortable List Files and Directories Recursively with Exclusion.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Abortable File Listing/VIPB - Abortable List Files and Directories Recursively with Exclusion.vi"/>
			<Item Name="VIPB_API.WasAbortLoopRequested.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.WasAbortLoopRequested.vi"/>
			<Item Name="VIPB_API.GetObjectRefnum.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetObjectRefnum.vi"/>
			<Item Name="VIPB_API.Object RefNum (Queue).ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Object RefNum (Queue).ctl"/>
			<Item Name="VIPB_API.Data.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Data.ctl"/>
			<Item Name="VIPB_API.PublicEvents.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.PublicEvents.ctl"/>
			<Item Name="VIPB_API.ProgressStatus - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.ProgressStatus - Cluster.ctl"/>
			<Item Name="VIPB_API.BuildResult - cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.BuildResult - cluster.ctl"/>
			<Item Name="VIPB_API.BuildResultStatus - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.BuildResultStatus - Enum.ctl"/>
			<Item Name="VIPB_API.PrivateEvents - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.PrivateEvents - Cluster.ctl"/>
			<Item Name="VIPB_API.AbortBuild Boolean.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.AbortBuild Boolean.ctl"/>
			<Item Name="VIPB_API.EventData - DisableMainUI - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.EventData - DisableMainUI - Cluster.ctl"/>
			<Item Name="VIPB_API.VIPBCloseRequester - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.VIPBCloseRequester - Enum.ctl"/>
			<Item Name="VIPB - Events - UpdatePaletteData - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Events - UpdatePaletteData - Cluster -.ctl"/>
			<Item Name="VIPB_API.Object Ref Type.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Core/VIPB_API.Object Ref Type.vi"/>
			<Item Name="VIPB_API.Create[private].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Create[private].vi"/>
			<Item Name="VIPB_API.Default Data.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Core/VIPB_API.Default Data.vi"/>
			<Item Name="VIPB_API.New.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Core/VIPB_API.New.vi"/>
			<Item Name="VIPB_API.Get Data.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Core/VIPB_API.Get Data.vi"/>
			<Item Name="VIPB - Abortable List Files and Directories Recursively.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Abortable File Listing/VIPB - Abortable List Files and Directories Recursively.vi"/>
			<Item Name="Strip Alpha or Beta Word from Version String.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Application Control/Strip Alpha or Beta Word from Version String.vi"/>
			<Item Name="VIPB - Get all Valid Extension.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get all Valid Extension.vi"/>
			<Item Name="VIPB_API.Palette - Type - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Type - Enum -.ctl"/>
			<Item Name="VIPB - Get Valid Extension.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get Valid Extension.vi"/>
			<Item Name="Filter Out Files that have been excluded from build settings.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/Filter Out Files that have been excluded from build settings.vi"/>
			<Item Name="VIPB Check if Source Files Tree Item is Folder.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Tree/VIPB Check if Source Files Tree Item is Folder.vi"/>
			<Item Name="Find nearest Parent override for Child.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Source Files Settings/Find nearest Parent override for Child.vi"/>
			<Item Name="OGPM Get LabVIEW Version and File Type.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Private/OGPM Get LabVIEW Version and File Type.vi"/>
			<Item Name="OGPM Mass Compile File Type - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Mass Compile File Type - Enum.ctl"/>
			<Item Name="Read Project Library File LabVIEW Version.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Read LVLib File Info/Read Project Library File LabVIEW Version.vi"/>
			<Item Name="VIPB_API.ValidateLVVersion[private].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.ValidateLVVersion[private].vi"/>
			<Item Name="VIPM Sort LabVIEW Versions (Fast).vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Sort LabVIEW Versions (Fast).vi"/>
			<Item Name="Sort Item Type - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/Sort Item Type - Enum.ctl"/>
			<Item Name="LogSort_Core.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/QuickSort Support/LogSort_Core.vi"/>
			<Item Name="LogSort_Stack.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/QuickSort Support/LogSort_Stack.vi"/>
			<Item Name="LogSort_Partition.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/QuickSort Support/LogSort_Partition.vi"/>
			<Item Name="LogSort_StackHandler.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/QuickSort Support/LogSort_StackHandler.vi"/>
			<Item Name="Sort 1D Array (Strings Smart).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/String/Sort 1D Array (Strings Smart).vi"/>
			<Item Name="string_less_than_comparison_smart.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/String/string_less_than_comparison_smart.vi"/>
			<Item Name="VIPM Sort Packages Mode Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Sort Packages Mode Enum.ctl"/>
			<Item Name="VIPB - MissingLVVersionDialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - MissingLVVersionDialog.vi"/>
			<Item Name="VIPB_API.GetDialogsFPTitle.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetDialogsFPTitle.vi"/>
			<Item Name="VIPB - Get VIPB Window Ref.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get VIPB Window Ref.vi"/>
			<Item Name="VIPM API Queue Manager.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM API Queue Manager.vi"/>
			<Item Name="VIPM API Queue Manager Mode.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM API Queue Manager Mode.ctl"/>
			<Item Name="VIPM API queue refnums cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM API queue refnums cluster.ctl"/>
			<Item Name="VIPB - VIPM is about to launch LV Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - VIPM is about to launch LV Dialog.vi"/>
			<Item Name="dialog.source_version_updated.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/dialog.source_version_updated.vi"/>
			<Item Name="dialog.source_version_overview.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/dialog.source_version_overview.vi"/>
			<Item Name="dialog.source_version_overview.populate_tree.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/dialog.source_version_overview.populate_tree.vi"/>
			<Item Name="VIPB_API.GetAbortStatusQueue.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetAbortStatusQueue.vi"/>
			<Item Name="VIPB_API.QuickLVVersionSettingsLookup.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.QuickLVVersionSettingsLookup.vi"/>
			<Item Name="VIPM Lookup LabVIEW Settings by Name.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Lookup LabVIEW Settings by Name.vi"/>
			<Item Name="First Time LabVIEW Connection Check and Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/support/First Time LabVIEW Connection Check and Dialog.vi"/>
			<Item Name="VIPB_API.CalculateDefaultPackageName.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Miscellaneous/VIPB_API.CalculateDefaultPackageName.vi"/>
			<Item Name="VIPM remove invalid filename characters.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM remove invalid filename characters.vi"/>
			<Item Name="VIPB - Is Name Multiplatform.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Is Name Multiplatform.vi"/>
			<Item Name="VIPB - LLBMgr Global Strings.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - LLBMgr Global Strings.vi"/>
			<Item Name="Remove Invalid Product Characters.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/Remove Invalid Product Characters.vi"/>
			<Item Name="VIPM Remove Trailing Period.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Remove Trailing Period.vi"/>
			<Item Name="VIPB_API.ListPackageMemberSourceFiles.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.ListPackageMemberSourceFiles.vi"/>
			<Item Name="VIPB_API.Custom Actions - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Custom Actions - Cluster.ctl"/>
			<Item Name="VIPB_API.Custom Build Actions - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Custom Build Actions - Cluster.ctl"/>
			<Item Name="VIPC File -- List Packages.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/VIPC File Utilities/VIPC File -- List Packages.vi"/>
			<Item Name="VIPB_API.UpdateVIPBDependenciesFromVIPC.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.UpdateVIPBDependenciesFromVIPC.vi"/>
			<Item Name="Source Files Page Values.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/Source Files Page Values.ctl"/>
			<Item Name="VIPB - Destination Names Blacklist.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Destination Names Blacklist.vi"/>
			<Item Name="VIPB - Built-in Destinations Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Built-in Destinations Enum.ctl"/>
			<Item Name="VIPB match extension.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB match extension.vi"/>
			<Item Name="Expand PathRoot.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/pathroots/Expand PathRoot.vi"/>
			<Item Name="Pathroots Enumeration.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/pathroots/Pathroots Enumeration.ctl"/>
			<Item Name="Expand LVTarget Path Root Enum.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/pathroots/Expand LVTarget Path Root Enum.vi"/>
			<Item Name="VIPB_API.Flatten Array to Formatted List.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.Flatten Array to Formatted List.vi"/>
			<Item Name="VIPB_API.GetSourceDistributionPkgExclusionList.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetSourceDistributionPkgExclusionList.vi"/>
			<Item Name="VIPB_API.CustomErrors - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.CustomErrors - Enum.ctl"/>
			<Item Name="LabVIEW Version to VIPM LabVIEW Version.vi" Type="VI" URL="../../../vipm-desktop/source/ProjectDragon/source/DragonProject/LabVIEW Version to VIPM LabVIEW Version.vi"/>
			<Item Name="VIPB_API.RaiseCustomError.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.RaiseCustomError.vi"/>
			<Item Name="VIPB_API.CreateCustomErrorHandlerDictionary.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.CreateCustomErrorHandlerDictionary.vi"/>
			<Item Name="SE_Error.Raise.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Component Error Handling/SE_Error.Raise.vi"/>
			<Item Name="SE_Error.LookupComponent.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Component Error Handling/_Private/SE_Error.LookupComponent.vi"/>
			<Item Name="SE_Error.ComponentInfo_Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Component Error Handling/_Private/SE_Error.ComponentInfo_Cluster.ctl"/>
			<Item Name="SE_Error.GetEnumSignature.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Component Error Handling/_Private/SE_Error.GetEnumSignature.vi"/>
			<Item Name="SE_Error.Register.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Component Error Handling/SE_Error.Register.vi"/>
			<Item Name="PCE Expand LLB Contents.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Expand LLB Contents.vi"/>
			<Item Name="VIPM - List Directory Recursive__ogtk.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/VIPM - List Directory Recursive__ogtk.vi"/>
			<Item Name="OGPM Determine New Dependency Problems.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Determine New Dependency Problems.vi"/>
			<Item Name="OGPM Missing Dependencies and Present Conflicts Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Missing Dependencies and Present Conflicts Cluster.ctl"/>
			<Item Name="OGPM Entity Comparison Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Entity Comparison Cluster.ctl"/>
			<Item Name="OGPM Check All Packages Dependencies.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Check All Packages Dependencies.vi"/>
			<Item Name="OGPM Check Package Dependencies.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Check Package Dependencies.vi"/>
			<Item Name="OGPM Check Entity Comparison Conditions.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Check Entity Comparison Conditions.vi"/>
			<Item Name="OGPM Entity Name and Version Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Entity Name and Version Cluster.ctl"/>
			<Item Name="OGPM Check Pkg OS Requirements.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Check Pkg OS Requirements.vi"/>
			<Item Name="OGPM Test OS Name and OS Version Conditions.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Test OS Name and OS Version Conditions.vi"/>
			<Item Name="OGPM Get OS Name and Version.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Get OS Name and Version.vi"/>
			<Item Name="OGPM Check Package Dependencies SubVI.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Check Package Dependencies SubVI.vi"/>
			<Item Name="OGPM Determine Missing Dependencies and Conflicts Present.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Determine Missing Dependencies and Conflicts Present.vi"/>
			<Item Name="OGPM Convert Labview Target version to LabVIEW Name with bitness.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Convert Labview Target version to LabVIEW Name with bitness.vi"/>
			<Item Name="VIPM Determine If valid OS and LV.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Determine If valid OS and LV.vi"/>
			<Item Name="OGPM Check Pkg LabVIEW Requirements.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Check Pkg LabVIEW Requirements.vi"/>
			<Item Name="Test for Target Compatibility.vi" Type="VI" URL="../../../vipm-desktop/source/Test for Target Compatibility.vi"/>
			<Item Name="is sub-package.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/is sub-package.vi"/>
			<Item Name="OGPM Find Package by Requirements.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Find Package by Requirements.vi"/>
			<Item Name="OGPM Package Full Name to Name and Version.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Package Full Name to Name and Version.vi"/>
			<Item Name="OGPM Find Newest Package by Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Find Newest Package by Name.vi"/>
			<Item Name="VIPM Sort Packages (Fast).vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Sort Packages (Fast).vi"/>
			<Item Name="OGPM Group Problems by Names.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Group Problems by Names.vi"/>
			<Item Name="OGPM Resolve Dependencies - Problem Type - Enum - .ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Resolve Dependencies - Problem Type - Enum - .ctl"/>
			<Item Name="OGPM Add Packages to List and Remove Existing.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Add Packages to List and Remove Existing.vi"/>
			<Item Name="Get LVAddons Folder.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/Get LVAddons Folder.vi"/>
			<Item Name="VIPM Treat Password Keywords.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/VIPM Treat Password Keywords.vi"/>
			<Item Name="VIPB - Password Type - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Password Type - Enum.ctl"/>
			<Item Name="VIPB - Update Build Hooks.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Miscellaneous/VIPB - Update Build Hooks.vi"/>
			<Item Name="VIPB - Expand and Collapse Symbolic Path.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Miscellaneous/VIPB - Expand and Collapse Symbolic Path.vi"/>
			<Item Name="Collapse to LVTarget PathRoot.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/pathroots/Collapse to LVTarget PathRoot.vi"/>
			<Item Name="Path to LVTarget PathRoot Based Path.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/pathroots/Path to LVTarget PathRoot Based Path.vi"/>
			<Item Name="VIPB - Package Bowser Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Package Bowser Dialog.vi"/>
			<Item Name="VIPB - Package Browser Mode - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Package Browser Mode - Enum.ctl"/>
			<Item Name="OGPM Lookup Package Display Name from Packages Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Lookup Package Display Name from Packages Info Array.vi"/>
			<Item Name="OGPM Lookup Package Display Name from Package Spec Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Lookup Package Display Name from Package Spec Array.vi"/>
			<Item Name="OGPM Create Display Version from Version and Release String.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Create Display Version from Version and Release String.vi"/>
			<Item Name="VIPB - Check Package in VIPC Dependency.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Check Package in VIPC Dependency.vi"/>
			<Item Name="VIPB - Package Bowser Dialog with Listboxes.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Package Bowser Dialog with Listboxes.vi"/>
			<Item Name="j-fuzzy.lvclass" Type="LVClass" URL="../../../vipm-desktop/source/JKI Reuse Pool/j-fuzzy/j-fuzzy.lvclass"/>
			<Item Name="VIPM Color Rows Listbox.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Color Rows Listbox.vi"/>
			<Item Name="feature.enhanced_quick_search.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Options Class/Features/feature.enhanced_quick_search.vi"/>
			<Item Name="VIPB_API.Direct Dependencies Added or Removed.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Direct Dependencies Added or Removed.vi"/>
			<Item Name="VIPB_API.Update External Dependencies.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Update External Dependencies.vi"/>
			<Item Name="VIPB_API.Resolve External Deps with Additional Ones.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Resolve External Deps with Additional Ones.vi"/>
			<Item Name="VIPB - New Destination.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - New Destination.vi"/>
			<Item Name="VIPB - Change Additional Destination Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Change Additional Destination Name.vi"/>
			<Item Name="VIPB - Destination Directory Combo Box.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Destination Directory Combo Box.ctl"/>
			<Item Name="VIPB - Get Destination Name Enum and is Built-in.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get Destination Name Enum and is Built-in.vi"/>
			<Item Name="VIPB - Convert Base Path and Subdirectory to Full Path.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Convert Base Path and Subdirectory to Full Path.vi"/>
			<Item Name="VIPB - Base Path Ring to Pathroot Symbol.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/VIPB - Base Path Ring to Pathroot Symbol.vi"/>
			<Item Name="VIPB_API.Destination Type Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Destination Type Enum.ctl"/>
			<Item Name="VIPB - Add or Remove LLB Extension.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Add or Remove LLB Extension.vi"/>
			<Item Name="Convert Path to Dir and SubDir.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Convert Path to Dir and SubDir.vi"/>
			<Item Name="VIPB - Pathroot Symbol to Base Path Ring.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/VIPB - Pathroot Symbol to Base Path Ring.vi"/>
			<Item Name="VIPB_API.SetBuildSettings.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.SetBuildSettings.vi"/>
			<Item Name="VIPB_API.Get Data to Modify.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Core/VIPB_API.Get Data to Modify.vi"/>
			<Item Name="VIPB_API.Set Modified Data.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Core/VIPB_API.Set Modified Data.vi"/>
			<Item Name="VIPB_API.WriteVIPBFile [core].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.WriteVIPBFile [core].vi"/>
			<Item Name="VIPB_API.XMLAttributes - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.XMLAttributes - Cluster.ctl"/>
			<Item Name="VIPB_API.GetLatestVersion.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.GetLatestVersion.vi"/>
			<Item Name="VIPB_API.VIPBFileVersion - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.VIPBFileVersion - Enum.ctl"/>
			<Item Name="VIPB_API.FlattenToXMLString.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.FlattenToXMLString.vi"/>
			<Item Name="VIPB_API.SetXMLDataName.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.SetXMLDataName.vi"/>
			<Item Name="VIPB_API.ConvertVIPBMemoryToFile.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ConvertVIPBMemoryToFile.vi"/>
			<Item Name="VIPB_API.HexEncodePaletteData.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexEncodePaletteData.vi"/>
			<Item Name="VIPB_API.LibraryPaletteDefinition[Hex Encoded] - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.LibraryPaletteDefinition[Hex Encoded] - Cluster.ctl"/>
			<Item Name="VIPB_API.HexEncodeLibraryGeneralSettings.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexEncodeLibraryGeneralSettings.vi"/>
			<Item Name="VIPB_API.LibraryGeneralSettings[Hex Encoded] - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.LibraryGeneralSettings[Hex Encoded] - Cluster.ctl"/>
			<Item Name="VIPB_API.HexEncodePaletteSetCluster.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexEncodePaletteSetCluster.vi"/>
			<Item Name="VIPB_API.PaletteSet[Hex Encoded] - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.PaletteSet[Hex Encoded] - Cluster.ctl"/>
			<Item Name="VIPB_API.VIPB File Data - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.VIPB File Data - Cluster -.ctl"/>
			<Item Name="VIPB_API.AdvancedSettings [Hex Encoded] - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.AdvancedSettings [Hex Encoded] - Cluster.ctl"/>
			<Item Name="VIPB_API.XMLStructure - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.XMLStructure - Cluster.ctl"/>
			<Item Name="VIPB_API.ComputeVIPBFileID(TextBased).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ComputeVIPBFileID(TextBased).vi"/>
			<Item Name="VIPB_API.GetFileAttribute.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.GetFileAttribute.vi"/>
			<Item Name="VIPB_API.ReadVIPBFile(Ver0.1).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ReadVIPBFile(Ver0.1).vi"/>
			<Item Name="VIPM Get User Name.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get User Name.vi"/>
			<Item Name="VIPB_API.FlushIconsFromPaletteItems.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Miscellaneous/VIPB_API.FlushIconsFromPaletteItems.vi"/>
			<Item Name="VIPB_API.Convert Build Paths (Absolute to Relative).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert Build Paths (Absolute to Relative).vi"/>
			<Item Name="VIPB_API.Absolute to Relative Path.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Absolute to Relative Path.vi"/>
			<Item Name="VIPB_API.GetDefaultBuildData[private].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.GetDefaultBuildData[private].vi"/>
			<Item Name="VIPB_API.Auto Generate Palette Icons.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Image Utilities/VIPB_API.Auto Generate Palette Icons.vi"/>
			<Item Name="PF.PixelFont.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Image Utilities/JKI Pixel Font/PF.PixelFont.vi"/>
			<Item Name="PF.GetPixelsText.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Image Utilities/JKI Pixel Font/PF.GetPixelsText.vi"/>
			<Item Name="PF.FlattenToLine.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Image Utilities/JKI Pixel Font/PF.FlattenToLine.vi"/>
			<Item Name="VIPB_API.DerivateIcon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.DerivateIcon.vi"/>
			<Item Name="VIPB_API.Draw Buttom.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Image Utilities/VIPB_API.Draw Buttom.vi"/>
			<Item Name="VIPB_API.Compute Buttom Frame Vertices.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Image Utilities/VIPB_API.Compute Buttom Frame Vertices.vi"/>
			<Item Name="Mask surrounding pixels.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Image/Mask surrounding pixels.vi"/>
			<Item Name="VIPB_API.Draw Button Frame.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Image Utilities/VIPB_API.Draw Button Frame.vi"/>
			<Item Name="VIPB_API.GetPaletteIconBackgroundColor.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetPaletteIconBackgroundColor.vi"/>
			<Item Name="VIPB_API.ReadVIPBFile[private].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.ReadVIPBFile[private].vi"/>
			<Item Name="VIPB_API.ReadVIPBFile [core].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ReadVIPBFile [core].vi"/>
			<Item Name="VIPB_API.VersionedDataContainer.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.VersionedDataContainer.vi"/>
			<Item Name="VIPB_API.AllVersionedData - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.AllVersionedData - Cluster.ctl"/>
			<Item Name="VIPB - Namespace Convention - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Namespace Convention - Enum -.ctl"/>
			<Item Name="VIPB_API.ReadVIPBFile(Latest).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ReadVIPBFile(Latest).vi"/>
			<Item Name="VIPB_API.ConvertVIPBFileToMemory.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ConvertVIPBFileToMemory.vi"/>
			<Item Name="VIPB_API.HexDecodePaletteData.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodePaletteData.vi"/>
			<Item Name="VIPB_API.HexDecodeLibraryGeneralSettings.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodeLibraryGeneralSettings.vi"/>
			<Item Name="VIPB_API.HexDecodePaletteSetsCluster.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodePaletteSetsCluster.vi"/>
			<Item Name="VIPB_API.Convert Build Paths (Relative to Absolute).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert Build Paths (Relative to Absolute).vi"/>
			<Item Name="VIPB_API.Relative to Absolute Path.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Relative to Absolute Path.vi"/>
			<Item Name="VIPB_API.Convert0.1To 0.2.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert0.1To 0.2.vi"/>
			<Item Name="VIPB_API.ReadVIPBFile(Ver0.2).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ReadVIPBFile(Ver0.2).vi"/>
			<Item Name="VIPB_API.ConvertVIPBFileToMemory (Ver0.2).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ConvertVIPBFileToMemory (Ver0.2).vi"/>
			<Item Name="VIPB_API.HexDecodeLibraryGeneralSettings (Ver0.2).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodeLibraryGeneralSettings (Ver0.2).vi"/>
			<Item Name="VIPB_API.HexDecodePaletteData0.2.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodePaletteData0.2.vi"/>
			<Item Name="VIPB_API.Convert0.2 To 0.3.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert0.2 To 0.3.vi"/>
			<Item Name="VIPB_API.Convert 0.3 To 0.4.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert 0.3 To 0.4.vi"/>
			<Item Name="VIPB_API.ReadVIPBFile(0.3).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ReadVIPBFile(0.3).vi"/>
			<Item Name="VIPB_API.ConvertVIPBFileToMemory (Ver0.3).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ConvertVIPBFileToMemory (Ver0.3).vi"/>
			<Item Name="VIPB_API.HexDecodePaletteData0.3.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodePaletteData0.3.vi"/>
			<Item Name="VIPB_API.HexDecodePaletteSetsCluster0.3.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodePaletteSetsCluster0.3.vi"/>
			<Item Name="VIPB_API.HexDecodeLibraryGeneralSettings (0.3).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodeLibraryGeneralSettings (0.3).vi"/>
			<Item Name="VIPB_API.Convert Build Paths V0.3 (Relative to Absolute).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert Build Paths V0.3 (Relative to Absolute).vi"/>
			<Item Name="VIPB_API.ReadVIPBFile(0.4).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ReadVIPBFile(0.4).vi"/>
			<Item Name="VIPB_API.ConvertVIPBFileToMemory (Ver0.4).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ConvertVIPBFileToMemory (Ver0.4).vi"/>
			<Item Name="VIPB_API.HexDecodeLibraryGeneralSettings (0.4).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodeLibraryGeneralSettings (0.4).vi"/>
			<Item Name="VIPB_API.HexDecodePaletteSetsCluster (0.4).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodePaletteSetsCluster (0.4).vi"/>
			<Item Name="VIPB_API.Convert Build Paths V0.4 (Relative to Absolute).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert Build Paths V0.4 (Relative to Absolute).vi"/>
			<Item Name="VIPB_API.Convert 0.4 To 0.5.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert 0.4 To 0.5.vi"/>
			<Item Name="VIPB_API.Convert 0.5 To 0.6.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert 0.5 To 0.6.vi"/>
			<Item Name="VIPB_API.ReadVIPBFile(0.5).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ReadVIPBFile(0.5).vi"/>
			<Item Name="VIPB_API.Convert Build Paths V0.5 (Relative to Absolute).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert Build Paths V0.5 (Relative to Absolute).vi"/>
			<Item Name="VIPB_API.ConvertVIPBFileToMemory (Ver0.5).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.ConvertVIPBFileToMemory (Ver0.5).vi"/>
			<Item Name="VIPB_API.HexDecodeLibraryGeneralSettings (0.5).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodeLibraryGeneralSettings (0.5).vi"/>
			<Item Name="VIPB_API.HexDecodePaletteSetsCluster (0.5).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.HexDecodePaletteSetsCluster (0.5).vi"/>
			<Item Name="VIPB_API.Convert 0.6 To Latest.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Read-Write VIPB/VIPB_API.Convert 0.6 To Latest.vi"/>
			<Item Name="VIPB_API.GUIDPaletteDefinition.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GUIDPaletteDefinition.vi"/>
			<Item Name="VIPB_API.GUIDPaletteData.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GUIDPaletteData.vi"/>
			<Item Name="VIPB_API.UpdateVIPBPaletteIcons.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.UpdateVIPBPaletteIcons.vi"/>
			<Item Name="VIPB - Palette Item Data - Recompute Icons.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Recompute Icons.vi"/>
			<Item Name="File Exist.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Possible OpenG VIs/File Exist.vi"/>
			<Item Name="Path is to an LLB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Possible OpenG VIs/Path is to an LLB.vi"/>
			<Item Name="VIPB - Palette Item Data - Simple Item Delete.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Simple Item Delete.vi"/>
			<Item Name="VIPB - Palette Item Data - Lookup By Position.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Lookup By Position.vi"/>
			<Item Name="VIPB - Palette Item Data - Replace Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Replace Icon.vi"/>
			<Item Name="VIPB_API.GetPaletteItemIcon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetPaletteItemIcon.vi"/>
			<Item Name="VIPB - Lookup Function by Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Primitive Function/VIPB - Lookup Function by Name.vi"/>
			<Item Name="VIPB - Get function List.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Primitive Function/VIPB - Get function List.vi"/>
			<Item Name="VIPB - Unescape Invalid Path Char.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Primitive Function/VIPB - Unescape Invalid Path Char.vi"/>
			<Item Name="Read Palette - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Read Palette - Proxy.vi"/>
			<Item Name="RTE_Read Palette.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/NI mnu editor/RTE_Read Palette.vi"/>
			<Item Name="Fix RTE Palette Data Path Issues.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/NI mnu editor/Fix RTE Palette Data Path Issues.vi"/>
			<Item Name="Fix RTE Path Issues.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/NI mnu editor/Fix RTE Path Issues.vi"/>
			<Item Name="Get Library Icon (New).vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Get Library Icon (New).vi"/>
			<Item Name="Decode Library XML Bin Data.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Decode Library XML Bin Data.vi"/>
			<Item Name="Decode Bytes and Strip Headers.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Decode/Decode Bytes and Strip Headers.vi"/>
			<Item Name="Decode Byteset.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Decode/Decode Byteset.vi"/>
			<Item Name="Decode Character.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Decode/Decode Character.vi"/>
			<Item Name="Strip Headers.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Decode/Strip Headers.vi"/>
			<Item Name="Get Property Name From XML.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Get Property Name From XML.vi"/>
			<Item Name="Get Library LabVIEW Version.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Get Library LabVIEW Version.vi"/>
			<Item Name="Read Library.vi" Type="VI" URL="../../../vipm-desktop/source/NI Support/Get Library Icon/Read Library.vi"/>
			<Item Name="VIPB - Palette Item Data - Replace Path.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Replace Path.vi"/>
			<Item Name="VIPB - Palette Item Data - Rename Item.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Rename Item.vi"/>
			<Item Name="Test for File in Packed Project Library.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Test for File in Packed Project Library.vi"/>
			<Item Name="VIPB_API.Refresh Palette Item Names.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Refresh Palette Item Names.vi"/>
			<Item Name="VIPB_API.Refresh Item name For Palette Data.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Refresh Item name For Palette Data.vi"/>
			<Item Name="VIPB_API.Create Item Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Create Item Name.vi"/>
			<Item Name="VIPB_API.GetBuildSettings.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetBuildSettings.vi"/>
			<Item Name="VIPB_API.Build Spec Cluster for API Call.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Build Spec Cluster for API Call.ctl"/>
			<Item Name="VIPB - Regenerate Palette [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Regenerate Palette [Action].vi"/>
			<Item Name="VIPB_API.Build Palette Data (smart directory structure mirror).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Synch Palette to Directories/VIPB_API.Build Palette Data (smart directory structure mirror).vi"/>
			<Item Name="VIPB_API.Build Palette Data (smart directory structure mirror) - core - .vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Synch Palette to Directories/VIPB_API.Build Palette Data (smart directory structure mirror) - core - .vi"/>
			<Item Name="VIPB_API.Build Palette Data (Cache).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Synch Palette to Directories/VIPB_API.Build Palette Data (Cache).vi"/>
			<Item Name="Virtual List Folder.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/Virtual List Folder.vi"/>
			<Item Name="Regular Expression Files and Folders Filter.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/Regular Expression Files and Folders Filter.vi"/>
			<Item Name="VIPB_API.GeneratePaletteItemData.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GeneratePaletteItemData.vi"/>
			<Item Name="VIPB_API.GenerateSubPaletteItemData.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GenerateSubPaletteItemData.vi"/>
			<Item Name="VIPM Use MNU if Exists.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPM Use MNU if Exists.vi"/>
			<Item Name="VIPM Use LVCLASS Icon if Exists.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPM Use LVCLASS Icon if Exists.vi"/>
			<Item Name="VIPM Use LVLIB Icon if Exists.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPM Use LVLIB Icon if Exists.vi"/>
			<Item Name="VIPB - Palette Item Data - Get Max Size.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Get Max Size.vi"/>
			<Item Name="VIPB - Palette Data - Create New Sub Palette.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Create New Sub Palette.vi"/>
			<Item Name="VIPB_API.GetMinimumPaletteSize.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetMinimumPaletteSize.vi"/>
			<Item Name="VIPB_API.FireUpdatePaletteDataEvent.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.FireUpdatePaletteDataEvent.vi"/>
			<Item Name="VIPB_API.Palette - Type Plus - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Palette - Type Plus - Enum -.ctl"/>
			<Item Name="VIPB - Palette Data - Rename SubPalette.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Rename SubPalette.vi"/>
			<Item Name="VIPB - Palette Data - Lookup by Position and Index.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Lookup by Position and Index.vi"/>
			<Item Name="VIPB - Palette Data - Find Root Palette Index.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Find Root Palette Index.vi"/>
			<Item Name="VIPB - Palette Item Data - Rename Item Short Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Rename Item Short Name.vi"/>
			<Item Name="VIPB.class - Get namespaced item name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB.class - Get namespaced item name.vi"/>
			<Item Name="VIPB - Palette Data - Replace Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Replace Icon.vi"/>
			<Item Name="VIPB - Validate Namespace.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Miscellaneous/VIPB - Validate Namespace.vi"/>
			<Item Name="VIPB_API.Protection Settings Radio.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Protection Settings Radio.ctl"/>
			<Item Name="VIPM Radio Button Boolean.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Radio Button Boolean.ctl"/>
			<Item Name="VI Save Instrument [Multiple] - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/VI Save Instrument [Multiple] - Proxy.vi"/>
			<Item Name="Open VI Reference [Multiple] - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Open VI Reference [Multiple] - Proxy.vi"/>
			<Item Name="Close VI Reference [Multiple]- Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Close VI Reference [Multiple]- Proxy.vi"/>
			<Item Name="App Library Open [Multiple]- Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/App Library Open [Multiple]- Proxy.vi"/>
			<Item Name="Close Library Reference [Multiple]- Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Close Library Reference [Multiple]- Proxy.vi"/>
			<Item Name="Library Save [Multiple] - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Library Save [Multiple] - Proxy.vi"/>
			<Item Name="VIPM IDNET Fix Linker Info.vi" Type="VI" URL="../../../vipm-desktop/source/IDNET Importer/support/VIPM IDNET Fix Linker Info.vi"/>
			<Item Name="Write Linker Info to File - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Write Linker Info to File - Proxy.vi"/>
			<Item Name="Read Linker Info from File (Exclude Friend Classes).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/LabVIEW Linker/Read Linker Info from File (Exclude Friend Classes).vi"/>
			<Item Name="Read Linker Info from File - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Read Linker Info from File - Proxy.vi"/>
			<Item Name="Remove Elements from Linker Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/LabVIEW Linker/Remove Elements from Linker Info Array.vi"/>
			<Item Name="Set LLB Caching - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Set LLB Caching - Proxy.vi"/>
			<Item Name="VIPM IDNET Read Readme Data.vi" Type="VI" URL="../../../vipm-desktop/source/IDNET Importer/support/VIPM IDNET Read Readme Data.vi"/>
			<Item Name="VIPM IDNET Remove Readme HTML.vi" Type="VI" URL="../../../vipm-desktop/source/IDNET Importer/support/VIPM IDNET Remove Readme HTML.vi"/>
			<Item Name="VIPB - Import Package Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Import Package Icon.vi"/>
			<Item Name="VIPB - Update Controls &amp; Function Palette Icons Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Update Controls &amp; Function Palette Icons Dialog.vi"/>
			<Item Name="VIPB - Import Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Import Icon.vi"/>
			<Item Name="VIPM - Select LV Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM - Select LV Version.vi"/>
			<Item Name="VIPM fix main window selector.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/Misc. Utilities/VIPM fix main window selector.vi"/>
			<Item Name="VIPM Target Picture Indicator.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/VIPM Target Picture Indicator.vi"/>
			<Item Name="VIPM Styles Constants.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Styles Constants.vi"/>
			<Item Name="VIPM LabVIEW Chooser Selector v2.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM LabVIEW Chooser Selector v2.ctl"/>
			<Item Name="VIPC Apply Continue Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPC Apply Continue Button.ctl"/>
			<Item Name="Cleanup IDNet Driver Project 2009 - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Cleanup IDNet Driver Project 2009 - Proxy.vi"/>
			<Item Name="VIPB - Remove Destination.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Remove Destination.vi"/>
			<Item Name="VIPB - Remove System Destination.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Remove System Destination.vi"/>
			<Item Name="Change MenuItem Parameters.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/menu/Change MenuItem Parameters.vi"/>
			<Item Name="Menu - Find Modifier - .vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/menu/Menu - Find Modifier - .vi"/>
			<Item Name="new package project GS data.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/new package project GS data.ctl"/>
			<Item Name="Next Steps from GS Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/Next Steps from GS Enum.ctl"/>
			<Item Name="Generate Formatted Recent VIPB List.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/Generate Formatted Recent VIPB List.vi"/>
			<Item Name="Truncate paths for UI display.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Truncate paths for UI display.vi"/>
			<Item Name="Escape Menu Underscore.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/menu/Escape Menu Underscore.vi"/>
			<Item Name="VIPB_API.GetPrivateEvents.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetPrivateEvents.vi"/>
			<Item Name="VIPB Getting Started Mode.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/VIPB Getting Started Mode.ctl"/>
			<Item Name="VIPB Create New VIPB Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Create New VIPB Button.ctl"/>
			<Item Name="VIPM Browse.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Browse.ctl"/>
			<Item Name="VIPB Back Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Back Button.ctl"/>
			<Item Name="VIPB - Main Window - App Data Subvi.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Main Window - App Data Subvi.vi"/>
			<Item Name="VIPB - Main Window - App Data.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Main Window - App Data.ctl"/>
			<Item Name="Source Files Page Control Refs Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/Source Files Page Control Refs Cluster.ctl"/>
			<Item Name="VIPM Checkbox Boolean.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Checkbox Boolean.ctl"/>
			<Item Name="Set Disable State for All Controls.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/User Interface/Set Disable State for All Controls.vi"/>
			<Item Name="Get All Front Panel Controls.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/User Interface/Get All Front Panel Controls.vi"/>
			<Item Name="Convert Panel to Screen Coordinate.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/User Interface/Convert Panel to Screen Coordinate.vi"/>
			<Item Name="VIPB - Palette Preview Options - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Palette Preview Options - Cluster -.ctl"/>
			<Item Name="VIPB - Handle LV Selector - core -.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/LV Selector Utilities/VIPB - Handle LV Selector - core -.vi"/>
			<Item Name="VIPB - LV Selector Update Mode - Enum - .ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - LV Selector Update Mode - Enum - .ctl"/>
			<Item Name="VIPB - Add Recent Items.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Add Recent Items.vi"/>
			<Item Name="Launch Floating Palette Asynch.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Launch Floating Palette Asynch.vi"/>
			<Item Name="VIPB - Get Paths.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get Paths.vi"/>
			<Item Name="Floating Palette Preview - UI - .vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Floating Palette Preview - UI - .vi"/>
			<Item Name="Draw Entire Palette.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Draw Entire Palette.vi"/>
			<Item Name="VIPB - Palette Item Data - Draw.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Draw.vi"/>
			<Item Name="Draw Palette Item.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Draw Palette Item.vi"/>
			<Item Name="VIPB - Merge VI Overlay Glyph.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Merge VI Overlay Glyph.vi"/>
			<Item Name="Update Palette Item.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Update Palette Item.vi"/>
			<Item Name="Create menu at runtime.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/menu/Create menu at runtime.vi"/>
			<Item Name="Palette Update Condition.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Update Condition.vi"/>
			<Item Name="VIPB - Build Floating Palette Menu String.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Build Floating Palette Menu String.vi"/>
			<Item Name="VIPB - Palette Item Data - Is on Empty Row.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Is on Empty Row.vi"/>
			<Item Name="VIPB - Palette Item Data - Is Blank Item.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Is Blank Item.vi"/>
			<Item Name="VIPB - Palette Item Data - Is on Empty Column.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Is on Empty Column.vi"/>
			<Item Name="VIPB_API.CheckIfHasToBeMergeVi.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.CheckIfHasToBeMergeVi.vi"/>
			<Item Name="VIPB - Find VI Paths.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Find VI Paths.vi"/>
			<Item Name="VIPB_API.Input Data - File Exclusion List - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Input Data - File Exclusion List - Cluster -.ctl"/>
			<Item Name="List Files and Directories Recursively with Exclusion.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/List Files and Directories Recursively with Exclusion.vi"/>
			<Item Name="List Files and Directories Recursively.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/List Files and Directories Recursively.vi"/>
			<Item Name="Clicked index to selected item.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Clicked index to selected item.vi"/>
			<Item Name="VIPB - Palette Mouse Up Event.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Palette Mouse Up Event.vi"/>
			<Item Name="VIPB - Palette Array to Row-Col.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Palette Array to Row-Col.vi"/>
			<Item Name="Array Point to RowCol.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Array/Array Point to RowCol.vi"/>
			<Item Name="VIPB - Palette Item Data - Delete Empty Row.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Delete Empty Row.vi"/>
			<Item Name="VIPB - Palette Item Data - Delete Row or Column.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Delete Row or Column.vi"/>
			<Item Name="VIPB - Edit Palette Icon [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Edit Palette Icon [Action].vi"/>
			<Item Name="VIPM Connect to LabVIEW Verbose.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/VIPM Connect to LabVIEW Verbose.vi"/>
			<Item Name="VIPM Can Connect to LabVIEW Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/VIPM Can Connect to LabVIEW Version.vi"/>
			<Item Name="Edit Icon - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Edit Icon - Proxy.vi"/>
			<Item Name="VIPB - Mouse Position LV2GBL.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Mouse Position LV2GBL.vi"/>
			<Item Name="Convert Screen to Panel Coordinate.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/User Interface/Convert Screen to Panel Coordinate.vi"/>
			<Item Name="VIPB - Palette Data - Delete Item.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Delete Item.vi"/>
			<Item Name="VIPB - Palette Item Data - Delete with Column Shift.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Delete with Column Shift.vi"/>
			<Item Name="VIPB - Palette Data - Get SubPalette Children.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Get SubPalette Children.vi"/>
			<Item Name="VIPB - Palette Item Data - Get SubPalette Indices.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Get SubPalette Indices.vi"/>
			<Item Name="VIPB_API.GetPublicEvents.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Public/VIPB_API.GetPublicEvents.vi"/>
			<Item Name="VIPB - Palette Data - Insert Space.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Insert Space.vi"/>
			<Item Name="VIPB - Palette Item Data - Get Size at Position.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Get Size at Position.vi"/>
			<Item Name="VIPB - Palette Item Data - Insert Space.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Insert Space.vi"/>
			<Item Name="VIPB - Palette Data Type &amp; Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Palette Data Type &amp; Name.vi"/>
			<Item Name="VIPB - Event Drag Over.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Event Drag Over.vi"/>
			<Item Name="VIPB - Get Drag Data.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get Drag Data.vi"/>
			<Item Name="VIPB - Drag &amp; Drop Data - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Drag &amp; Drop Data - Cluster -.ctl"/>
			<Item Name="VIPB - Prepare Drag Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Prepare Drag Icon.vi"/>
			<Item Name="Make Checkboard Picture.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Image/Make Checkboard Picture.vi"/>
			<Item Name="generate random number with input exclusion.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Array/generate random number with input exclusion.vi"/>
			<Item Name="VIPB - Event Drag Over - Adjust Palette Size.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Event Drag Over - Adjust Palette Size.vi"/>
			<Item Name="VIPB_API.FireDragStartEvent.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.FireDragStartEvent.vi"/>
			<Item Name="VIPB - Event Drag Start.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Event Drag Start.vi"/>
			<Item Name="VIPB - Palette Item Data - Delete Empty Column.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Delete Empty Column.vi"/>
			<Item Name="VIPB - Palette Item Data - Insert Row.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Insert Row.vi"/>
			<Item Name="VIPB - Palette Item Data - Insert Column.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Item Data Manipulation/VIPB - Palette Item Data - Insert Column.vi"/>
			<Item Name="VIPB - Palette Data - Auto Size to Visible.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Auto Size to Visible.vi"/>
			<Item Name="VIPB - Drop effect.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Drop effect.vi"/>
			<Item Name="VIPB - Drop Effect - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Drop Effect - Enum.ctl"/>
			<Item Name="Byte-array to Bit-array.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Image/Byte-array to Bit-array.vi"/>
			<Item Name="VIPB - Array Selected Element to Mouse Position.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Array Selected Element to Mouse Position.vi"/>
			<Item Name="Ramp by Samples.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Analysis/Ramp by Samples.vi"/>
			<Item Name="VIPB - Decide if SubPalette need to be close.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Decide if SubPalette need to be close.vi"/>
			<Item Name="VIPB - Explorer Drop.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Explorer Drop.vi"/>
			<Item Name="VIPB_API.EnableDisableUI.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Public/VIPB_API.EnableDisableUI.vi"/>
			<Item Name="VIPB_API.EnableDisablePalettePreviewUI.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.EnableDisablePalettePreviewUI.vi"/>
			<Item Name="VIPB - Palette Data - Add Item to Palette.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Add Item to Palette.vi"/>
			<Item Name="VIPB - Palette Data - Search by Directory.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Search by Directory.vi"/>
			<Item Name="VIPB_API.GeneratePaletteItemData[Advanced].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GeneratePaletteItemData[Advanced].vi"/>
			<Item Name="VIPB - Drop Item [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Drop Item [Action].vi"/>
			<Item Name="VIPB - Palette Data - is Move Allowed.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - is Move Allowed.vi"/>
			<Item Name="VIPB - Palette Data - is Subpalette.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - is Subpalette.vi"/>
			<Item Name="VIPB - Palette Data - Move Item.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Data Manipulation/VIPB - Palette Data - Move Item.vi"/>
			<Item Name="VIPB - InsertVI Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - InsertVI Dialog.vi"/>
			<Item Name="VIPB - PPL Select Member Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - PPL Select Member Dialog.vi"/>
			<Item Name="VIPB - Insert VI [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Insert VI [Action].vi"/>
			<Item Name="VIPB - Initialize UI Elements.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Initialize UI Elements.vi"/>
			<Item Name="Draw Palette Background Items.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Draw Palette Background Items.vi"/>
			<Item Name="VIPB - Rename Subpalette [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Rename Subpalette [Action].vi"/>
			<Item Name="VIPB - Mandatory Regenerate Icon Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Mandatory Regenerate Icon Dialog.vi"/>
			<Item Name="VIPB - InsertFunction Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - InsertFunction Dialog.vi"/>
			<Item Name="Generic text (combo box) entry prompt.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Generic text (combo box) entry prompt.vi"/>
			<Item Name="VIPB - Get Function Names Codes and Icons.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Primitive Function/VIPB - Get Function Names Codes and Icons.vi"/>
			<Item Name="VIPB - Select Primitive Function - UI - .vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Select Primitive Function - UI - .vi"/>
			<Item Name="VIPB - Smart Lookup.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Primitive Function/VIPB - Smart Lookup.vi"/>
			<Item Name="VIPB - Insert Function [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Insert Function [Action].vi"/>
			<Item Name="VIPB - Rename Palette Item Short Name [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Rename Palette Item Short Name [Action].vi"/>
			<Item Name="VIPB_API.Create Short Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Create Short Name.vi"/>
			<Item Name="VIPB_API.Create VI Title.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.Create VI Title.vi"/>
			<Item Name="VIPB - Rename Palette Item VI Title [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Rename Palette Item VI Title [Action].vi"/>
			<Item Name="VIPM Prompt for Subpalette Description.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPM Prompt for Subpalette Description.vi"/>
			<Item Name="VIPB - Import Palette Icon [Action].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Import Palette Icon [Action].vi"/>
			<Item Name="VIPB - InsertMNU Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - InsertMNU Dialog.vi"/>
			<Item Name="VIPB Palette Window Up Back Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Palette Window Up Back Button.ctl"/>
			<Item Name="VIPM Throber Control.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Throber Control.vi"/>
			<Item Name="VIPM Throber List Animated.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Throber List Animated.ctl"/>
			<Item Name="VIPM Enable Disable PCE.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Enable Disable PCE.vi"/>
			<Item Name="VIPM Get PCE Window VI Reference.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get PCE Window VI Reference.vi"/>
			<Item Name="VIPB_API.BuildAndPackageLibraryFromSpec.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Public/VIPB_API.BuildAndPackageLibraryFromSpec.vi"/>
			<Item Name="VIPB_API.BuildAndPackageLibraryFromSpec[Private].vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.BuildAndPackageLibraryFromSpec[Private].vi"/>
			<Item Name="dictionary cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/dictionary cluster.ctl"/>
			<Item Name="VIPB_API.ConvertBuildPropertiesToDictionaryFormat.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Miscellaneous/VIPB_API.ConvertBuildPropertiesToDictionaryFormat.vi"/>
			<Item Name="VIPB_API.build properties cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.build properties cluster.ctl"/>
			<Item Name="VIPB_API.ExpandBuildSettingsToProjectSpec.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Miscellaneous/VIPB_API.ExpandBuildSettingsToProjectSpec.vi"/>
			<Item Name="VIPB_API.project specification.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.project specification.ctl"/>
			<Item Name="VIPB_API.Export Library Source Folder to temp Build location.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Export Library Source Folder to temp Build location.vi"/>
			<Item Name="Delete Recursive with Best Effort.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/Delete Recursive with Best Effort.vi"/>
			<Item Name="VIPM Set File Hidden Attribute.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Set File Hidden Attribute.vi"/>
			<Item Name="VIPB_API.Build Source Distribution.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Build Source Distribution.vi"/>
			<Item Name="VIPB_API.Build Application from Build File API__ogb_api.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Build CBR VIs/VIPB_API.Build Application from Build File API__ogb_api.vi"/>
			<Item Name="OGPM Get Path to OpenG Builder VI call.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Get Path to OpenG Builder VI call.vi"/>
			<Item Name="VIPB - Copy Support Files__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Copy Support Files__ogb.vi"/>
			<Item Name="VIPB - Remove Duplicated Paths from 1D Array__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Remove Duplicated Paths from 1D Array__ogb.vi"/>
			<Item Name="VIPB - Compare Two Paths__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Compare Two Paths__ogtk__ogb.vi"/>
			<Item Name="VIPB - Make List of Support Files to Copy__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Make List of Support Files to Copy__ogb.vi"/>
			<Item Name="VIPB - Valid Path - Traditional__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Valid Path - Traditional__ogtk__ogb.vi"/>
			<Item Name="VIPB - Recursive List Files and Directories__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Recursive List Files and Directories__ogb.vi"/>
			<Item Name="VIPB - DEAB Filter 1D Path Array (w underlying paths)__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Filter 1D Path Array (w underlying paths)__ogb.vi"/>
			<Item Name="VIPB - DEAB Error Handler__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Error Handler__ogb.vi"/>
			<Item Name="VIPB - DEAB Error Counter__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Error Counter__ogb.vi"/>
			<Item Name="VIPB - DEAB Simple Error Handler (proxy)__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Simple Error Handler (proxy)__ogb.vi"/>
			<Item Name="VIPB - VI Library__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - VI Library__ogtk__ogb.vi"/>
			<Item Name="VIPB - DEAB Log Store__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Log Store__ogb.vi"/>
			<Item Name="VIPB - DEAB Create Dir if Non-Existant__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Create Dir if Non-Existant__ogb.vi"/>
			<Item Name="VIPB - 1D Array to String__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - 1D Array to String__ogtk__ogb.vi"/>
			<Item Name="VIPB - DEAB Read Build File__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Read Build File__ogb.vi"/>
			<Item Name="VIPB - Build Error Cluster__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Build Error Cluster__ogtk__ogb.vi"/>
			<Item Name="VIPB - String to 1D Array__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - String to 1D Array__ogtk__ogb.vi"/>
			<Item Name="VIPB - Convert File Extension (Path)__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Convert File Extension (Path)__ogtk__ogb.vi"/>
			<Item Name="VIPB - Convert File Extension (String)__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Convert File Extension (String)__ogtk__ogb.vi"/>
			<Item Name="VIPB - Filter Comments__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Filter Comments__ogb.vi"/>
			<Item Name="VIPB - Trim Whitespace (String)__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Trim Whitespace (String)__ogtk__ogb.vi"/>
			<Item Name="VIPB - Conditional Auto-Indexing Tunnel (String)__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Conditional Auto-Indexing Tunnel (String)__ogtk__ogb.vi"/>
			<Item Name="VIPB - Build Parameters Constant__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Build Parameters Constant__ogb.vi"/>
			<Item Name="VIPB - Extra Build File Info Constants__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Extra Build File Info Constants__ogb.vi"/>
			<Item Name="VIPB - DEAB Filter 1D String Array w RegExp__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Filter 1D String Array w RegExp__ogb.vi"/>
			<Item Name="VIPB - DEAB Validate Cfg Key Names__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Validate Cfg Key Names__ogb.vi"/>
			<Item Name="VIPB - DEAB Filter 1D String Array__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Filter 1D String Array__ogb.vi"/>
			<Item Name="VIPB - OGB Build File Format Version__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - OGB Build File Format Version__ogb.vi"/>
			<Item Name="VIPB - DEAB Version Str-Num Converter__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Version Str-Num Converter__ogb.vi"/>
			<Item Name="VIPB - DEAB Read Path key__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Read Path key__ogb.vi"/>
			<Item Name="VIPB - Treat Mac Path__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Treat Mac Path__ogb.vi"/>
			<Item Name="VIPB - Expand Pathroot API__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Expand Pathroot API__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Check Pathroots Installed API__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Check Pathroots Installed API__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Pathroots Resource Directory__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Pathroots Resource Directory__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Application Directory__ogtk__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Application Directory__ogtk__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Expand Pathroot__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Expand Pathroot__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Expand Pathroot Enum__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Expand Pathroot Enum__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Check OpenG Pathroots Installed API__ogpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Check OpenG Pathroots Installed API__ogpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - OpenG Pathroots Resource Directory__ogpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - OpenG Pathroots Resource Directory__ogpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Application Directory__ogtk__ogpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Application Directory__ogtk__ogpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Expand OpenG Pathroot API__ogpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Expand OpenG Pathroot API__ogpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Build Error Cluster__ogtk__ogpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Build Error Cluster__ogtk__ogpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Check Platform Pathroots Installed API__platpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Check Platform Pathroots Installed API__platpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Platform Pathroots Resource Directory__platpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Platform Pathroots Resource Directory__platpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Application Directory__ogtk__platpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Application Directory__ogtk__platpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Expand Platform Pathroot API__platpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Expand Platform Pathroot API__platpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - Build Error Cluster__ogtk__platpthrtapi__pthrtapi__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Build Error Cluster__ogtk__platpthrtapi__pthrtapi__ogb.vi"/>
			<Item Name="VIPB - DEAB Build Absolute Path__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Build Absolute Path__ogb.vi"/>
			<Item Name="VIPB - Append Path to Root if Relative__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Append Path to Root if Relative__ogtk__ogb.vi"/>
			<Item Name="VIPB - DEAB Append Log File Suffix__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - DEAB Append Log File Suffix__ogb.vi"/>
			<Item Name="VIPB - Filter Illegal File Names__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Filter Illegal File Names__ogb.vi"/>
			<Item Name="VIPB - Application Directory__ogtk__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Application Directory__ogtk__ogb.vi"/>
			<Item Name="VIPB - LabVIEWVersion__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - LabVIEWVersion__ogb.vi"/>
			<Item Name="VIPB_API.Build Package Source.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Build Package Source.vi"/>
			<Item Name="VIPB_API.Create MNU Files from BMPs.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Create MNU Files from BMPs.vi"/>
			<Item Name="VIPB_API.Create Palette MNU Files.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Create Palette MNU Files.vi"/>
			<Item Name="VIPB_API.Format Item Data.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Format Item Data.vi"/>
			<Item Name="VI Path Map Cluster of arrays.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VI Path Map Cluster of arrays.ctl"/>
			<Item Name="VIPB_API.Add blank items to palette item data.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Synch Palette to Directories/VIPB_API.Add blank items to palette item data.vi"/>
			<Item Name="VIPB_API.ConvertRelativePathsToPathroots.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.ConvertRelativePathsToPathroots.vi"/>
			<Item Name="Path with Pathroot to mnu Pathroot.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/pathroots/Path with Pathroot to mnu Pathroot.vi"/>
			<Item Name="Write Menus Files.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/NI mnu editor/Write Menus Files.vi"/>
			<Item Name="Write Palette - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Write Palette - Proxy.vi"/>
			<Item Name="RTE_Write Palette.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/NI mnu editor/RTE_Write Palette.vi"/>
			<Item Name="Fix help file path in mnu file.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Fix help file path in mnu file.vi"/>
			<Item Name="VIPB_API.Create Palette DIR MNU File.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Create Palette DIR MNU File.vi"/>
			<Item Name="Update Cluster With Key-Value Pairs.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Update Cluster With Key-Value Pairs.vi"/>
			<Item Name="Key-Value Pairs to VCluster.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Key-Value Pairs to VCluster.vi"/>
			<Item Name="Encode - Decode Brackets__ogtk.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Encode - Decode Brackets__ogtk.vi"/>
			<Item Name="Get Value by Key.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Get Value by Key.vi"/>
			<Item Name="expand keywords.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/expand keywords.vi"/>
			<Item Name="VCluster to Key-Value Pairs.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/VCluster to Key-Value Pairs.vi"/>
			<Item Name="Merge Dictionary B into A.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Merge Dictionary B into A.vi"/>
			<Item Name="VIPB_API.Create Package Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Create Package Icon.vi"/>
			<Item Name="VIPB_API.Create Functions and Controls Palette MNU File Names.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.Create Functions and Controls Palette MNU File Names.vi"/>
			<Item Name="VIPB_API.Cleanup temporary files and dir.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Cleanup temporary files and dir.vi"/>
			<Item Name="OGPM Run Script VI.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Run Script VI.vi"/>
			<Item Name="Ensure Getting Started Window Not Open - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Ensure Getting Started Window Not Open - Proxy.vi"/>
			<Item Name="OGPM Get Script VI Variant Input Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Get Script VI Variant Input Name.vi"/>
			<Item Name="OGPM Get Script VI Error Output Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Get Script VI Error Output Name.vi"/>
			<Item Name="OGPM Test for Package Changes Allowed.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/OGPM Test for Package Changes Allowed.vi"/>
			<Item Name="VIPM ZLIB Extract File__ogtk.vi" Type="VI" URL="../../../vipm-desktop/source/zlib hacks/VIPM ZLIB Extract File__ogtk.vi"/>
			<Item Name="OGPM Validate or Sign Package File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Private/OGPM Validate or Sign Package File.vi"/>
			<Item Name="OGPM Validate or Sign Package File - Low Level.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Private/OGPM Validate or Sign Package File - Low Level.vi"/>
			<Item Name="OGPM Package Signing Algorithm - Enum.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Private/OGPM Package Signing Algorithm - Enum.vi"/>
			<Item Name="Create Staircase Array.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Array/Create Staircase Array.vi"/>
			<Item Name="ZipCross Replace File in Archive.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Replace File in Archive.vi"/>
			<Item Name="VIPM - ZLIB Replace File in Archive__ogtk.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/VIPM - ZLIB Replace File in Archive__ogtk.vi"/>
			<Item Name="ZipCross Get Global Info.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Get Global Info.vi"/>
			<Item Name="ZipCross Go To Next File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Go To Next File.vi"/>
			<Item Name="ZipCross Go To First File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Go To First File.vi"/>
			<Item Name="ZipCross Close CollectionEnumerator.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Close CollectionEnumerator.vi"/>
			<Item Name="ZipCross Get Current File Info.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Get Current File Info.vi"/>
			<Item Name="VIPB - Launch VIPB Window.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Launch VIPB Window.vi"/>
			<Item Name="VIPB Filepath from Dynamic Call.vi" Type="VI" URL="../../../vipm-desktop/source/Main/globals/VIPB Filepath from Dynamic Call.vi"/>
			<Item Name="VIPB_API.HandleCustomError.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.HandleCustomError.vi"/>
			<Item Name="SE_Error.Handle.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Component Error Handling/SE_Error.Handle.vi"/>
			<Item Name="SE_Error.LookupComponentByCode.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Component Error Handling/_Private/SE_Error.LookupComponentByCode.vi"/>
			<Item Name="VIPM API.lvlib" Type="Library" URL="../../../vipm-desktop/source/Main/VIPM API/VIPM API.lvlib"/>
			<Item Name="VIPM API - LV Version Change - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM API - LV Version Change - Cluster.ctl"/>
			<Item Name="Calculate Absolute Path.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Calculate Absolute Path.vi"/>
			<Item Name="Calculate Relative Path.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Calculate Relative Path.vi"/>
			<Item Name="Read JSON.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/JSONtext/Read JSON.vi"/>
			<Item Name="PCE Info from VIPB - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Info from VIPB - Cluster.ctl"/>
			<Item Name="PCE Launch Paramaters Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Launch Paramaters Cluster.ctl"/>
			<Item Name="OGPM Lookup Package Info from Packages Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Lookup Package Info from Packages Info Array.vi"/>
			<Item Name="VIPM Package Blacklist.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Package Blacklist.vi"/>
			<Item Name="VIRM VIRM Task Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Data Structures/VIRM VIRM Task Info Cluster.ctl"/>
			<Item Name="VIPM Validate Action on Packages.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM Validate Action on Packages.vi"/>
			<Item Name="VIPM pkg sub task.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM pkg sub task.ctl"/>
			<Item Name="VIPM Package Subtask Type.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Package Subtask Type.ctl"/>
			<Item Name="VIPM task item.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM task item.ctl"/>
			<Item Name="VIPM Pkg list dialog shifter.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Pkg list dialog shifter.ctl"/>
			<Item Name="PCE Task Item - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE Task Item - Cluster.ctl"/>
			<Item Name="PCE package subtasks - cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE package subtasks - cluster.ctl"/>
			<Item Name="PCE package task mode - enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE package task mode - enum.ctl"/>
			<Item Name="VIPM Build Task Results List for Listbox.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Build Task Results List for Listbox.vi"/>
			<Item Name="VIPM overall error type enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM overall error type enum.ctl"/>
			<Item Name="VIPM Current Task Phase Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Current Task Phase Enum.ctl"/>
			<Item Name="VIPM Send Progress range and refnum.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Progress/VIPM Send Progress range and refnum.vi"/>
			<Item Name="VIPM Sort Package Validation List.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Sort Package Validation List.vi"/>
			<Item Name="VIPM add asc desc symbol.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM add asc desc symbol.vi"/>
			<Item Name="VIPM package list display mode.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM package list display mode.ctl"/>
			<Item Name="VIPM Reselect Previously Selected.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Reselect Previously Selected.vi"/>
			<Item Name="VIPM - Post Process Error Details.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM - Post Process Error Details.vi"/>
			<Item Name="VIPM Done Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Done Button.ctl"/>
			<Item Name="VIPM Update Verification Dialog Listbox.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Update Verification Dialog Listbox.vi"/>
			<Item Name="VIPM UI Mode - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM UI Mode - Enum.ctl"/>
			<Item Name="VIPM build repository task list for MCL.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM build repository task list for MCL.vi"/>
			<Item Name="VIPM Progress Bar Handler.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Progress/VIPM Progress Bar Handler.vi"/>
			<Item Name="VIPM Flat Progress Bar - Non Strict.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Flat Progress Bar - Non Strict.ctl"/>
			<Item Name="VIPM Throber List Static.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Throber List Static.ctl"/>
			<Item Name="VIPM progress.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM progress.ctl"/>
			<Item Name="VIPM Status Window.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM Status Window.vi"/>
			<Item Name="VIPM Status.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Status.ctl"/>
			<Item Name="VIPM Format P&amp;N buttons for properties window.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Format P&amp;N buttons for properties window.vi"/>
			<Item Name="VIPM Package Properties Window Data.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Package Properties Window Data.ctl"/>
			<Item Name="control ref cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/control ref cluster.ctl"/>
			<Item Name="OGPM Read License Agreement Text.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/OGPM Read License Agreement Text.vi"/>
			<Item Name="OGPM License Window.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Private/OGPM License Window.vi"/>
			<Item Name="Convert Package Info to Formatted Text.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Convert Package Info to Formatted Text.vi"/>
			<Item Name="VIPM Get Valid OS and LV Strings.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Valid OS and LV Strings.vi"/>
			<Item Name="VIPM Convert Package Dependencies to Strings.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Convert Package Dependencies to Strings.vi"/>
			<Item Name="Output empty string if no data.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Output empty string if no data.vi"/>
			<Item Name="OGPM Has License Agreement.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/OGPM Has License Agreement.vi"/>
			<Item Name="OGPM Are Any version of Packages in Public Repository.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM Are Any version of Packages in Public Repository.vi"/>
			<Item Name="OGPM Is Package in Public or JKI Repo.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM Is Package in Public or JKI Repo.vi"/>
			<Item Name="OGPM Download Repositories List.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM Download Repositories List.vi"/>
			<Item Name="OGPM Highlight Item in LabVIEW Palettes (launch).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Palette Integration/OGPM Highlight Item in LabVIEW Palettes (launch).vi"/>
			<Item Name="VIPM Palette Item for Show in Palettes.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Palette Item for Show in Palettes.vi"/>
			<Item Name="Expand LVTarget Path Root.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/pathroots/Expand LVTarget Path Root.vi"/>
			<Item Name="VIPM Expand Palette Item Pathroots.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Expand Palette Item Pathroots.vi"/>
			<Item Name="VIPM Sort Palettes from Top Down.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Sort Palettes from Top Down.vi"/>
			<Item Name="Dependency Sorting.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Dependency Sorting/Dependency Sorting.vi"/>
			<Item Name="FilterDependsOnlyOn.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Dependency Sorting/FilterDependsOnlyOn.vi"/>
			<Item Name="DependsOnlyOn.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Dependency Sorting/DependsOnlyOn.vi"/>
			<Item Name="VIPM Get First Palette Item Name.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get First Palette Item Name.vi"/>
			<Item Name="VIPM Update Status Box.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Status Box/VIPM Update Status Box.vi"/>
			<Item Name="VIPB - Show Package in Explorer.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Show Package in Explorer.vi"/>
			<Item Name="VIPM General List Color on Value Changed.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM General List Color on Value Changed.vi"/>
			<Item Name="VIPM Initialize Listbox for Checkboxes.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Initialize Listbox for Checkboxes.vi"/>
			<Item Name="VIPM Mini - State Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Mini - State Enum.ctl"/>
			<Item Name="Get VIPM Browser UI VI Reference.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Get VIPM Browser UI VI Reference.vi"/>
			<Item Name="VIPM Home Mini UI.vi" Type="VI" URL="../../../vipm-desktop/source/Home/VIPM Home Mini UI.vi"/>
			<Item Name="VIPM Mini - Diminished Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Mini - Diminished Button.ctl"/>
			<Item Name="VIPM Mini - Back Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Mini - Back Button.ctl"/>
			<Item Name="VIPM Home - Package State Glyph BIG.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Home - Package State Glyph BIG.ctl"/>
			<Item Name="Set Controls Array Visible Property.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Set Controls Array Visible Property.vi"/>
			<Item Name="VIPM Mini Get Package Data Array for Quick Search.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Search/VIPM Mini Get Package Data Array for Quick Search.vi"/>
			<Item Name="VIPM find related packages and revisions.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM find related packages and revisions.vi"/>
			<Item Name="Set Calling VI Wnd Topmost &amp; Active.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Set Calling VI Wnd Topmost &amp; Active.vi"/>
			<Item Name="VIPM Enforce Global Login and Show Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/JKI APIs/VIPM Enforce Global Login and Show Dialog.vi"/>
			<Item Name="VIPM is Beta or Alpha Release.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM is Beta or Alpha Release.vi"/>
			<Item Name="Calculate Position and Area After Padding.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Calculate Position and Area After Padding.vi"/>
			<Item Name="Padding -- Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Padding -- Cluster.ctl"/>
			<Item Name="Stick Mode -- Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Stick Mode -- Enum.ctl"/>
			<Item Name="Position Control Relative to Region (Array).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Position Control Relative to Region (Array).vi"/>
			<Item Name="Pane Dimensions -- Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Pane Dimensions -- Cluster.ctl"/>
			<Item Name="Position Control Relative to Region.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Position Control Relative to Region.vi"/>
			<Item Name="VIPM Login Mini UI.vi" Type="VI" URL="../../../vipm-desktop/source/Home/VIPM Login Mini UI.vi"/>
			<Item Name="VIPM Get Main Window Title.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Main Window Title.vi"/>
			<Item Name="Ensure Listbox Scrollbars Visible.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Ensure Listbox Scrollbars Visible.vi"/>
			<Item Name="Ensure Array Scrollbars Visible.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Ensure Array Scrollbars Visible.vi"/>
			<Item Name="Array Coords to Index.vi" Type="VI" URL="../../../vipm-desktop/source/3rd Party/Array Coords to Index.vi"/>
			<Item Name="Get Active Window Name and Application Path.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Get Active Window Name and Application Path.vi"/>
			<Item Name="Fit Control to Region.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Fit Control to Region.vi"/>
			<Item Name="Fit Mode -- Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Fit Mode -- Enum.ctl"/>
			<Item Name="Ensure Listbox Selected Item Visible.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Ensure Listbox Selected Item Visible.vi"/>
			<Item Name="Ensure 1D Array Index Item Visible.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Ensure 1D Array Index Item Visible.vi"/>
			<Item Name="Position Control Relative to Region (Poly).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Position Control Relative to Region (Poly).vi"/>
			<Item Name="VIPM Log-Out.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/VIPM Log-Out.vi"/>
			<Item Name="Setup Login menu.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/Setup Login menu.vi"/>
			<Item Name="Login Menu Event Refnum.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/Login Menu Event Refnum.vi"/>
			<Item Name="Login Menu Refnum Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Login Form/Login Menu Refnum Cluster.ctl"/>
			<Item Name="show login (yes-no).vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/show login (yes-no).vi"/>
			<Item Name="Do Local Event on Web Data.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Do Local Event on Web Data.vi"/>
			<Item Name="VIPM Check Network Error Code.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Check Network Error Code.vi"/>
			<Item Name="VIPM Network Error Message.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Network Error Message.vi"/>
			<Item Name="Calculate Boolean Colors Array from OFF Color and Step.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Calculate Boolean Colors Array from OFF Color and Step.vi"/>
			<Item Name="Enable or Diable (Gray out) Control.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Enable or Diable (Gray out) Control.vi"/>
			<Item Name="Package List Changed Event Refnum.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/Package List Changed Event Refnum.vi"/>
			<Item Name="VIPM Browser Build Big Package Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/VIPM Browser Build Big Package Info Array.vi"/>
			<Item Name="Show Window Titlebar on Mac and Linux.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Mac OS X/Show Window Titlebar on Mac and Linux.vi"/>
			<Item Name="VIPM Check for latest App Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Update/VIPM Check for latest App Version.vi"/>
			<Item Name="VIPM Download Latest Version.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Update/VIPM Download Latest Version.vi"/>
			<Item Name="VIPM Internet Version Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Internet Version Cluster.ctl"/>
			<Item Name="VIPM Get Latest Version Info.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Update/VIPM Get Latest Version Info.vi"/>
			<Item Name="OGPM Append URL if Relative.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Append URL if Relative.vi"/>
			<Item Name="VIPM Send Status Message.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Update/VIPM Send Status Message.vi"/>
			<Item Name="run advanced updater.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/run advanced updater.vi"/>
			<Item Name="check for updates mode.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/check for updates mode.ctl"/>
			<Item Name="Set Package Search ID.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Set Package Search ID.vi"/>
			<Item Name="GUID 32 String to Hyphenated UUID.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Data Manipulation/GUID 32 String to Hyphenated UUID.vi"/>
			<Item Name="Do Search (Local and or Remote).vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Do Search (Local and or Remote).vi"/>
			<Item Name="VIPM Mini Package Search.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Search/VIPM Mini Package Search.vi"/>
			<Item Name="VIPM quick filter list.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Filters/VIPM quick filter list.vi"/>
			<Item Name="VIPM Search String to Search Array.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Filters/VIPM Search String to Search Array.vi"/>
			<Item Name="VIPM Add Spaces to Missing Data Elements.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Add Spaces to Missing Data Elements.vi"/>
			<Item Name="Build IDE and OS Info for Search.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Build IDE and OS Info for Search.vi"/>
			<Item Name="VIPM Log Package Installation Event.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Log Package Installation Event.vi"/>
			<Item Name="VIPM Package Web Data to Spec.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/VIPM Package Web Data to Spec.vi"/>
			<Item Name="Periodic State String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/JKI State Machine/Periodic State String.vi"/>
			<Item Name="VIPM - Do Floating Behavior.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/VIPM - Do Floating Behavior.vi"/>
			<Item Name="Check if this LabVIEW is Active.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Scripting/Check if this LabVIEW is Active.vi"/>
			<Item Name="VIPM Is Window Floating Topmost.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/VIPM Is Window Floating Topmost.vi"/>
			<Item Name="Get Control Ref of Cluster Element by Name.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Get Control Ref of Cluster Element by Name.vi"/>
			<Item Name="Test Coords Inside (Over) Control Bounds.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Test Coords Inside (Over) Control Bounds.vi"/>
			<Item Name="Test Coords Inside Rectangle.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Test Coords Inside Rectangle.vi"/>
			<Item Name="VIPM - Floating Text Display Window.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/VIPM - Floating Text Display Window.vi"/>
			<Item Name="Is Valid (Not Null).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Comparison/Is Valid (Not Null).vi"/>
			<Item Name="Download Package File from JKI API.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM API/Public/Download Package File from JKI API.vi"/>
			<Item Name="VIPM Get Remote Package URL.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Get Remote Package URL.vi"/>
			<Item Name="VIPM Send Multiple Commands to Main State Machine.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM API/Support/VIPM Send Multiple Commands to Main State Machine.vi"/>
			<Item Name="OGPM Get Package Install State.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/OGPM Get Package Install State.vi"/>
			<Item Name="OGPM Package Installation State - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Package Installation State - Enum.ctl"/>
			<Item Name="OGPM Lookup Package Install and Demo Status.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/OGPM Lookup Package Install and Demo Status.vi"/>
			<Item Name="Get Package State Glyph from State String.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Get Package State Glyph from State String.vi"/>
			<Item Name="VIPM Home - Package State Glyph SMALL.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Home - Package State Glyph SMALL.ctl"/>
			<Item Name="Get Recent Releases.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Get Recent Releases.vi"/>
			<Item Name="Get Most Starred Packages.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Get Most Starred Packages.vi"/>
			<Item Name="Package List Sort By -- Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Package List Sort By -- Enum.ctl"/>
			<Item Name="Package Data -- Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI APIs/Packages/Package Data -- Cluster.ctl"/>
			<Item Name="Read-Write Stats Cache File.vi" Type="VI" URL="../../../vipm-desktop/source/Home/Support/Read-Write Stats Cache File.vi"/>
			<Item Name="Open Project Explorer.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Open Project Explorer.vi"/>
			<Item Name="Project Explorer - UI.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Explorer - UI.vi"/>
			<Item Name="Handle Window Titlebar Pane Clicks.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Handle Window Titlebar Pane Clicks.vi"/>
			<Item Name="Test Coords Inside a Panel Control.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Test Coords Inside a Panel Control.vi"/>
			<Item Name="Test Coords Inside Control.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Test Coords Inside Control.vi"/>
			<Item Name="Handle Window Drag Mouse Click.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Handle Window Drag Mouse Click.vi"/>
			<Item Name="VIPM General Tree Control Initialize Colors.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM General Tree Control Initialize Colors.vi"/>
			<Item Name="Add Project to Tree.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Add Project to Tree.vi"/>
			<Item Name="dotVIPM Read NIPKG Dependencies.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/dotVIPM Read NIPKG Dependencies.vi"/>
			<Item Name="Get Dragon Icon Path.vi" Type="VI" URL="../../../vipm-desktop/source/ProjectDragon/source/DragonProject/Get Dragon Icon Path.vi"/>
			<Item Name="Read Icon File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Image/Read Icon File.vi"/>
			<Item Name="Project Explorer - Tree Glyph Symbols - Ring.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Explorer - Tree Glyph Symbols - Ring.ctl"/>
			<Item Name="Get Package States List.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Get Package States List.vi"/>
			<Item Name="Check if Package (or newer) is Installed in LabVIEW.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Check if Package (or newer) is Installed in LabVIEW.vi"/>
			<Item Name="Get Tree Tags from Drag Data.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Tree Control/Get Tree Tags from Drag Data.vi"/>
			<Item Name="Get Process ID (PID) from Image (EXE) Path.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Windows/Get Process ID (PID) from Image (EXE) Path.vi"/>
			<Item Name="Open Welcome Window.vi" Type="VI" URL="../../../vipm-desktop/source/Welcome/Open Welcome Window.vi"/>
			<Item Name="Welcome UI.vi" Type="VI" URL="../../../vipm-desktop/source/Welcome/Welcome UI.vi"/>
			<Item Name="Shorten Path for Display.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Shorten Path for Display.vi"/>
			<Item Name="VIPM SystemTray - Is Running.vi" Type="VI" URL="../../../vipm-desktop/source/SystemTray/VIPM SystemTray - Is Running.vi"/>
			<Item Name="VIPM SystemTray - Globals.vi" Type="VI" URL="../../../vipm-desktop/source/SystemTray/VIPM SystemTray - Globals.vi"/>
			<Item Name="NotifyIcon User Event Ref.ctl" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/TypeDefs/NotifyIcon User Event Ref.ctl"/>
			<Item Name="System.Windows.Forms" Type="Document" URL="System.Windows.Forms">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Open Project Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Open Project Dialog.vi"/>
			<Item Name="VIPB_API.Multiline String to List Pattern Array.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.Multiline String to List Pattern Array.vi"/>
			<Item Name="Project Explorer - Close Project Explorer.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Explorer - Close Project Explorer.vi"/>
			<Item Name="Feedback UI.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/Feedback UI.vi"/>
			<Item Name="Auto Show-Hide String Vertical Scrollbar.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/Auto Show-Hide String Vertical Scrollbar.vi"/>
			<Item Name="Create FogBugz Case.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/Create FogBugz Case.vi"/>
			<Item Name="Escape URL String -- JKI SDP.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/JKI Reuse Pool/Escape URL String -- JKI SDP.vi"/>
			<Item Name="POSTBuffer - JKI SDP.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/POSTBuffer - JKI SDP.vi"/>
			<Item Name="Get Lib.vi -- JKI SDP.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/Get Lib.vi -- JKI SDP.vi"/>
			<Item Name="SmartPathToString -- JKI SDP.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/SmartPathToString -- JKI SDP.vi"/>
			<Item Name="Parse Status Line - JKI DP.vi" Type="VI" URL="../../../vipm-desktop/source/Feedback UI/Parse Status Line - JKI DP.vi"/>
			<Item Name="Recursive File List -- MAX DEPTH.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Recursive File List -- MAX DEPTH.vi"/>
			<Item Name="Dragon Config - Get Recent Projects.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Dragon Config - Get Recent Projects.vi"/>
			<Item Name="Get Dragon Settings File Path.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Get Dragon Settings File Path.vi"/>
			<Item Name="Dragon Config - Remove Project.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Dragon Config - Remove Project.vi"/>
			<Item Name="Listbox Point to Row and Item Name.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Listbox Point to Row and Item Name.vi"/>
			<Item Name="Check for Dragon Update.vi" Type="VI" URL="../../../vipm-desktop/source/ProjectDragon/source/Support/Check for Dragon Update.vi"/>
			<Item Name="Get Dragon Installation Info.vi" Type="VI" URL="../../../vipm-desktop/source/ProjectDragon/source/Support/Get Dragon Installation Info.vi"/>
			<Item Name="Is Dragon Installed.vi" Type="VI" URL="../../../vipm-desktop/source/ProjectDragon/source/Support/Is Dragon Installed.vi"/>
			<Item Name="OGPM Open Project in LabVIEW.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/OGPM Open Project in LabVIEW.vi"/>
			<Item Name="App Project Open - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/App Project Open - Proxy.vi"/>
			<Item Name="LVCLI - Check is Installed.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/LabVIEWCLI/LVCLI - Check is Installed.vi"/>
			<Item Name="LVCLI - Mass Compile.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/LabVIEWCLI/LVCLI - Mass Compile.vi"/>
			<Item Name="Window Snap Process.vi" Type="VI" URL="../../../vipm-desktop/source/Window Snap/Window Snap Process.vi"/>
			<Item Name="Window Snap Process - Command - Enum.vi" Type="VI" URL="../../../vipm-desktop/source/Window Snap/Window Snap Process - Command - Enum.vi"/>
			<Item Name="Last Active Window - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Window Snap/Last Active Window - Enum.ctl"/>
			<Item Name="Window Snap Message Queue - Queue Ref.ctl" Type="VI" URL="../../../vipm-desktop/source/Window Snap/Window Snap Message Queue - Queue Ref.ctl"/>
			<Item Name="Window Snap Message - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Window Snap/Window Snap Message - Cluster.ctl"/>
			<Item Name="System.Drawing" Type="Document" URL="System.Drawing">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Position Control Relative to Pane.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Position Control Relative to Pane.vi"/>
			<Item Name="Get Owning Pane of Control.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/User Interface/Get Owning Pane of Control.vi"/>
			<Item Name="Set Parent Child Window Relationship.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Parent Child VIs/Set Parent Child Window Relationship.vi"/>
			<Item Name="Show Hide Titlebar.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Window Style/Show Hide Titlebar.vi"/>
			<Item Name="Reposition Child Window.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Parent Child VIs/Reposition Child Window.vi"/>
			<Item Name="Resize Window (hwnd).vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Resize Window (hwnd).vi"/>
			<Item Name="Extract Window Origin and Size.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Extract Window Origin and Size.vi"/>
			<Item Name="Window Rectangle.ctl" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/Controls/Window Rectangle.ctl"/>
			<Item Name="Get Window HWnd.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Get Window HWnd.vi"/>
			<Item Name="Get Window Rectangle (hwnd).vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Get Window Rectangle (hwnd).vi"/>
			<Item Name="Window Rectangle (hwnd).ctl" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/Controls/Window Rectangle (hwnd).ctl"/>
			<Item Name="Redraw Window.vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Redraw Window.vi"/>
			<Item Name="Move Window (hwnd).vi" Type="VI" URL="../../../vipm-desktop/source/Insert Window into Front Panel/Utilities/WinUtil HWND/Move Window (hwnd).vi"/>
			<Item Name="Project Explorer - UI - App Data - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Explorer - UI - App Data - Cluster.ctl"/>
			<Item Name="Project Explorer - UI - Active Tab - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Explorer - UI - Active Tab - Enum.ctl"/>
			<Item Name="OGPM Close Project in LabVIEW.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/OGPM Close Project in LabVIEW.vi"/>
			<Item Name="App Project Close - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/App Project Close - Proxy.vi"/>
			<Item Name="App Project Save - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/App Project Save - Proxy.vi"/>
			<Item Name="Project Configuration - SubPanel UI.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Configuration - SubPanel UI.vi"/>
			<Item Name="LVCLI - Mass Compile Read Log Status.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/LabVIEWCLI/LVCLI - Mass Compile Read Log Status.vi"/>
			<Item Name="Dragon Config - Add Project.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Dragon Config - Add Project.vi"/>
			<Item Name="OGPM Add Package File to Cache.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM Add Package File to Cache.vi"/>
			<Item Name="OGPM Raise Error if Package Signature is Invalid.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Raise Error if Package Signature is Invalid.vi"/>
			<Item Name="OGPM Current Package Spec Format Version.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Current Package Spec Format Version.vi"/>
			<Item Name="OGPM Raise Error if Package MD5 is Invalid.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Raise Error if Package MD5 is Invalid.vi"/>
			<Item Name="OGPM Packages Info Cluster to Array of Package Info Clusters.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Packages Info Cluster to Array of Package Info Clusters.vi"/>
			<Item Name="OGPM Add Package Spec and Icon to Cache.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM Add Package Spec and Icon to Cache.vi"/>
			<Item Name="VIPM - Make File Writeable__jki_lib_file - Fix Permissions Error on Mac.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/VIPM - Make File Writeable__jki_lib_file - Fix Permissions Error on Mac.vi"/>
			<Item Name="OGPM Extract Image from Pkg to Temp Dir.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Extract Image from Pkg to Temp Dir.vi"/>
			<Item Name="OGPM Get Cached Package Spec and Icon.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM Get Cached Package Spec and Icon.vi"/>
			<Item Name="OGPM Package Info Array to Cluster of Package Info Clusters.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Package Info Array to Cluster of Package Info Clusters.vi"/>
			<Item Name="OGPM Extract Sub-Packages to Temp Dir.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Extract Sub-Packages to Temp Dir.vi"/>
			<Item Name="VIPM General Tree Color on Value Changed (Arrays).vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM General Tree Color on Value Changed (Arrays).vi"/>
			<Item Name="Fix Linker Info in Project Recursive Search.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Install into Project Folder/Fix Linker Info in Project Recursive Search.vi"/>
			<Item Name="OGPM Installed Files Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Installed Files Cluster.ctl"/>
			<Item Name="Fix Linker Info in Project.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Install into Project Folder/Fix Linker Info in Project.vi"/>
			<Item Name="Adjust File Path for Virtual Environment.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Install into Project Folder/Adjust File Path for Virtual Environment.vi"/>
			<Item Name="Read Palette_RUNTIME.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Palette API/Read Palette_RUNTIME.vi"/>
			<Item Name="Write Palette_RUNTIME.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Palette API/Write Palette_RUNTIME.vi"/>
			<Item Name="Read Palette_Preserve Pseudo Path - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Read Palette_Preserve Pseudo Path - Proxy.vi"/>
			<Item Name="Convert 2009 Palette Data Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/support/Convert 2009 Palette Data Cluster.vi"/>
			<Item Name="VIPM - Merge Clusters__jki_lib_variant (Support for Cluster with Array of Clusters).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Variant/VIPM - Merge Clusters__jki_lib_variant (Support for Cluster with Array of Clusters).vi"/>
			<Item Name="Write Palette_Preserve Pseudo Path - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Write Palette_Preserve Pseudo Path - Proxy.vi"/>
			<Item Name="VIPB - Sort VI Hierarchy__ogb.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Sort VI Hierarchy__ogb.vi"/>
			<Item Name="OGPM Mass Compile - Lower Level.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/OGPM Mass Compile - Lower Level.vi"/>
			<Item Name="PCE Read VI Hierarchy on Disk.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Read VI Hierarchy on Disk.vi"/>
			<Item Name="Test Path For Class Private Data CTL.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/LVOOP/Test Path For Class Private Data CTL.vi"/>
			<Item Name="Test Begining or End - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/String/Test Begining or End - Enum.ctl"/>
			<Item Name="Match String Beginning or End.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/String/Match String Beginning or End.vi"/>
			<Item Name="VIPM Add New Work Items to Work Product.vi" Type="VI" URL="../../../vipm-desktop/source/Utilities/VIPM Add New Work Items to Work Product.vi"/>
			<Item Name="VIPM Find Linker Index or Append.vi" Type="VI" URL="../../../vipm-desktop/source/Utilities/VIPM Find Linker Index or Append.vi"/>
			<Item Name="PCE Test if VI or CTL is a Channel Instance.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Test if VI or CTL is a Channel Instance.vi"/>
			<Item Name="PCE Test is inside a PPL.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Test is inside a PPL.vi"/>
			<Item Name="ResolveSymbolicPaths - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/ResolveSymbolicPaths - Proxy.vi"/>
			<Item Name="VIPB - Linker info to VI Hierarchy Structure.vi" Type="VI" URL="../../../vipm-desktop/source/VIPB System Package/VIPB - Linker info to VI Hierarchy Structure.vi"/>
			<Item Name="Adjust Linker File Paths for Virtual Environment.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Install into Project Folder/Adjust Linker File Paths for Virtual Environment.vi"/>
			<Item Name="Project Explorer - Tree Tag to Item Info.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Explorer - Tree Tag to Item Info.vi"/>
			<Item Name="Project Explorer - Package Tree Tag to Info.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/Project Explorer - Package Tree Tag to Info.vi"/>
			<Item Name="App Project Toggle Items View Active - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/App Project Toggle Items View Active - Proxy.vi"/>
			<Item Name="VIPM SystemTray - Set Icon Idle.vi" Type="VI" URL="../../../vipm-desktop/source/SystemTray/VIPM SystemTray - Set Icon Idle.vi"/>
			<Item Name="NotifyIcon - Set Icon.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/NotifyIcon - Set Icon.vi"/>
			<Item Name="VIPM SystemTray - Go Busy.vi" Type="VI" URL="../../../vipm-desktop/source/SystemTray/VIPM SystemTray - Go Busy.vi"/>
			<Item Name="VIPM SystemTray - Show Message.vi" Type="VI" URL="../../../vipm-desktop/source/SystemTray/VIPM SystemTray - Show Message.vi"/>
			<Item Name="NotifyIcon - Show BalloonTip.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/NotifyIcon - Show BalloonTip.vi"/>
			<Item Name="VIPM Project - Close.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Project Explorer/VIPM Project - Close.vi"/>
			<Item Name="VIPM Position Window.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Position Window.vi"/>
			<Item Name="VIPM Position Window - Core - .vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Position Window - Core - .vi"/>
			<Item Name="VIPM Set LV Version Selector Vertical Size.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Set LV Version Selector Vertical Size.vi"/>
			<Item Name="VIPM Get Big Button Font Size.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Big Button Font Size.vi"/>
			<Item Name="VIPM Previous Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Previous Button.ctl"/>
			<Item Name="VIPM Uninstall Package Button (in properties).ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Uninstall Package Button (in properties).ctl"/>
			<Item Name="Add to Library Button from Pkg Props Dialog.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/Add to Library Button from Pkg Props Dialog.ctl"/>
			<Item Name="Show in LabVIEW Button from Pkg Props Dialog.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/Show in LabVIEW Button from Pkg Props Dialog.ctl"/>
			<Item Name="Show Examples Button from Pkg Props Dialog.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/Show Examples Button from Pkg Props Dialog.ctl"/>
			<Item Name="VIPM Next Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Next Button.ctl"/>
			<Item Name="VIPM Package Info Window Install Package Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Package Info Window Install Package Button.ctl"/>
			<Item Name="VIPM Select Old Package OK Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Select Old Package OK Button.ctl"/>
			<Item Name="window menu.rtm" Type="Document" URL="../../../vipm-desktop/source/Main/Package Properties Window/window menu.rtm"/>
			<Item Name="VIRM Get VIRM Window Ref.vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Support/VIRM Get VIRM Window Ref.vi"/>
			<Item Name="VIPM Initialize MCL for Checkboxes.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Multi-column Support/VIPM Initialize MCL for Checkboxes.vi"/>
			<Item Name="VIPM package function.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM package function.ctl"/>
			<Item Name="VIPM pkg task error level.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM pkg task error level.ctl"/>
			<Item Name="VIPM pkg task information.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM pkg task information.ctl"/>
			<Item Name="Package Task Lists Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/Package Task Lists Cluster.ctl"/>
			<Item Name="VIPM Show Install Errors.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Show Install Errors.ctl"/>
			<Item Name="VIPM Finish Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Finish Button.ctl"/>
			<Item Name="VIPM Continue Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Continue Button.ctl"/>
			<Item Name="VIPM Validate Action on Packages.rtm" Type="Document" URL="../../../vipm-desktop/source/Main/VIPM Validate Action on Packages.rtm"/>
			<Item Name="rfc822 DateTime String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/RSS/rfc822 DateTime String.vi"/>
			<Item Name="Anything to Section Data.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/Anything to Section Data.vi"/>
			<Item Name="MGI__Get Type Info.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/SubVIs/MGI__Get Type Info.vi"/>
			<Item Name="MGI__Get Cluster Elements.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/SubVIs/MGI__Get Cluster Elements.vi"/>
			<Item Name="MGI__Replace Characters.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/SubVIs/MGI__Replace Characters.vi"/>
			<Item Name="MGI__Process Array Elements.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/SubVIs/MGI__Process Array Elements.vi"/>
			<Item Name="MGI__Build Line.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/SubVIs/MGI__Build Line.vi"/>
			<Item Name="Write Section Data to Disk.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/Write Section Data to Disk.vi"/>
			<Item Name="Remove Default Values from Section Data.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Third Party Tool/MGI Read Write Anything/Remove Default Values from Section Data.vi"/>
			<Item Name="VIPM Select Repo from List Dialog Box.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM Select Repo from List Dialog Box.vi"/>
			<Item Name="VIPM Remove Package From Library.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/VIPM Remove Package From Library.vi"/>
			<Item Name="Package List Class.lvlib" Type="Library" URL="../../../vipm-desktop/source/Main/PkgLIST Class/Package List Class.lvlib"/>
			<Item Name="OGPM Remove Package File from Cache.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM Remove Package File from Cache.vi"/>
			<Item Name="OGPM Remove Package Spec and Icon From Cache.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM Remove Package Spec and Icon From Cache.vi"/>
			<Item Name="VIPB_API.RegisterCustomError.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.RegisterCustomError.vi"/>
			<Item Name="VIPB_API.DestroyCustomError.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.DestroyCustomError.vi"/>
			<Item Name="VIPB_API.Build and Package Library--AppData.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/VIPB_API.Build and Package Library--AppData.vi"/>
			<Item Name="VIPB_API.Build and Package Library--AppData--Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/VIPB_API.Build and Package Library--AppData--Cluster.ctl"/>
			<Item Name="VIPB_API.Build Package.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Build Package.vi"/>
			<Item Name="VIPB_API.Create File Groups String - High Level.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.Create File Groups String - High Level.vi"/>
			<Item Name="VIPB_API.Create File Groups String.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.Create File Groups String.vi"/>
			<Item Name="VIPB_API.Create File Group String.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.Create File Group String.vi"/>
			<Item Name="VIPB_API.Replace Mode - Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Replace Mode - Enum.ctl"/>
			<Item Name="Get Relative Path from Root if Absolute.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/Get Relative Path from Root if Absolute.vi"/>
			<Item Name="Get Relative Path from Root if Absolute (Scalar).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/Get Relative Path from Root if Absolute (Scalar).vi"/>
			<Item Name="Get Relative Path from Root if Absolute (Array).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/file/Get Relative Path from Root if Absolute (Array).vi"/>
			<Item Name="VIPB_API.File Group - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.File Group - Cluster.ctl"/>
			<Item Name="VIPB_API.Create File Group Cluster.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/Build Source Distribution Support/VIPB_API.Create File Group Cluster.vi"/>
			<Item Name="OGPB Build Package from Build File__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/OGPB Build Package from Build File__VIPB__OGB.vi"/>
			<Item Name="OGPB Read Build File__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/Static API/OGPB Read Build File__VIPB__OGB.vi"/>
			<Item Name="OGPB Build Absolute Paths in Spec__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Build Absolute Paths in Spec__VIPB__OGB.vi"/>
			<Item Name="OGPB Build Absolute Path__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Build Absolute Path__VIPB__OGB.vi"/>
			<Item Name="OGPB Path Root Manager__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Path Root Manager__VIPB__OGB.vi"/>
			<Item Name="OGPM PATH Keyword Manager__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Path Keyword Expansion/OGPM PATH Keyword Manager__VIPB__OGB.vi"/>
			<Item Name="OGPM PATH Keyword Manager__VIPB__OGB.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Path Keyword Expansion/OGPM PATH Keyword Manager__VIPB__OGB.ctl"/>
			<Item Name="OGPM PATH Type Enumaration__VIPB__OGB.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Path Keyword Expansion/OGPM PATH Type Enumaration__VIPB__OGB.ctl"/>
			<Item Name="OGPM PATH Convert Keyword__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Path Keyword Expansion/OGPM PATH Convert Keyword__VIPB__OGB.vi"/>
			<Item Name="OGPB Default Target Dir__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Default Target Dir__VIPB__OGB.vi"/>
			<Item Name="OGPB Build Package from Spec__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/Static API/OGPB Build Package from Spec__VIPB__OGB.vi"/>
			<Item Name="OGPB Build Package__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Build Package__VIPB__OGB.vi"/>
			<Item Name="OGPB Build Pkg File List from Spec__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Build Pkg File List from Spec__VIPB__OGB.vi"/>
			<Item Name="OGPB Add Icon to Pkg Files__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Add Icon to Pkg Files__VIPB__OGB.vi"/>
			<Item Name="OGPB Add File Groups to Pkg Files__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Add File Groups to Pkg Files__VIPB__OGB.vi"/>
			<Item Name="OGPB Construct File Group Source Paths and Archive Names__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Construct File Group Source Paths and Archive Names__VIPB__OGB.vi"/>
			<Item Name="OGPB Add Script VIs to Pkg Files__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Add Script VIs to Pkg Files__VIPB__OGB.vi"/>
			<Item Name="OGPB Create Package From Pkg Files__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Create Package From Pkg Files__VIPB__OGB.vi"/>
			<Item Name="OGPB Remove Key from Config File String__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Remove Key from Config File String__VIPB__OGB.vi"/>
			<Item Name="ZipCross Store Stream.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Store Stream.vi"/>
			<Item Name="JKI-ZLIB Specific Path to Common Path__ogtk.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/JKI-ZLIB Specific Path to Common Path__ogtk.vi"/>
			<Item Name="Write Data to Temp File.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Write Data to Temp File.vi"/>
			<Item Name="Add License Text File to VI Package.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Add License Text File to VI Package.vi"/>
			<Item Name="Add License File to VI Package.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Add License File to VI Package.vi"/>
			<Item Name="OGPB Clean-Up Spec File.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Build Package/OGPB Clean-Up Spec File.vi"/>
			<Item Name="OGPB Write Build File__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/Static API/OGPB Write Build File__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write Package Name__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write Package Name__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write Description__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write Description__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write Platform__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write Platform__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write Script VIs__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write Script VIs__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write Dependencies__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write Dependencies__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write Files__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write Files__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write File Groups__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write File Groups__VIPB__OGB.vi"/>
			<Item Name="OGPB Correct Package Name Cluster__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Correct Package Name Cluster__VIPB__OGB.vi"/>
			<Item Name="OGPB Correct String to Proper Value__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Correct String to Proper Value__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write Activation__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write Activation__VIPB__OGB.vi"/>
			<Item Name="OGPB SpecFile - Write LabVIEW.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/Spec File Support/OGPB SpecFile - Write LabVIEW.vi"/>
			<Item Name="OGPB Build Non-Absolute Paths in Spec__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Build Non-Absolute Paths in Spec__VIPB__OGB.vi"/>
			<Item Name="OGPB Build Non-Absolute Path__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Build Non-Absolute Path__VIPB__OGB.vi"/>
			<Item Name="OGPB Build Target Path (PathRoot based if possible)__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Build Target Path (PathRoot based if possible)__VIPB__OGB.vi"/>
			<Item Name="OGPB Expand File Paths in Spec__VIPB__OGB.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Package Builder (Write from Spec)/support/OGPB Expand File Paths in Spec__VIPB__OGB.vi"/>
			<Item Name="Replace Keywords in Config String.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Replace Keywords in Config String.vi"/>
			<Item Name="Find Keywords in Config String Keys.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Find Keywords in Config String Keys.vi"/>
			<Item Name="Set Value by Key.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Set Value by Key.vi"/>
			<Item Name="Replace Keywords in String.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Replace Keywords in String.vi"/>
			<Item Name="Add New Key.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/keyword substitution/Add New Key.vi"/>
			<Item Name="Add Sub-Package to VI Package.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Add Sub-Package to VI Package.vi"/>
			<Item Name="VIPB_API.Validate VIs and Mass Compile.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Validate VIs and Mass Compile.vi"/>
			<Item Name="VIPB.class - List Source files that are VIs.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB.class - List Source files that are VIs.vi"/>
			<Item Name="VIPB_API.Remap Temp File Paths to Actual.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Remap Temp File Paths to Actual.vi"/>
			<Item Name="VIPB_API.Open References to Source VIs.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Open References to Source VIs.vi"/>
			<Item Name="VIPB_API.UpdateBuiltVIWindowTitles and Mass Compile.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.UpdateBuiltVIWindowTitles and Mass Compile.vi"/>
			<Item Name="VIPM Wait on VIs Unloaded from Memory.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/VIPM Wait on VIs Unloaded from Memory.vi"/>
			<Item Name="App All VIs - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/App All VIs - Proxy.vi"/>
			<Item Name="VIPM Update VI Titles.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPM Update VI Titles.vi"/>
			<Item Name="VIPB_API.OpenPkgSourceVIsWithDialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.OpenPkgSourceVIsWithDialog.vi"/>
			<Item Name="VIPB_API.List VIs in Memory.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.List VIs in Memory.vi"/>
			<Item Name="VIPB_API.Use Filename or Fully Qualified Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Use Filename or Fully Qualified Name.vi"/>
			<Item Name="VIPB - Pre Package Build Validation Error Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/VIPB - Pre Package Build Validation Error Dialog.vi"/>
			<Item Name="Error Dialog.rtm" Type="Document" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Utilities/Error Dialog.rtm"/>
			<Item Name="VIPB_API.AbortBuild.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Public/VIPB_API.AbortBuild.vi"/>
			<Item Name="VIPB_API.SendAbortMessage(Legacy).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.SendAbortMessage(Legacy).vi"/>
			<Item Name="VIPB_API.Check Source Files Beneath LabVIEW.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Check Source Files Beneath LabVIEW.vi"/>
			<Item Name="VIPB_API.Check Source Files Cross-Linked.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Check Source Files Cross-Linked.vi"/>
			<Item Name="VIPB_API.Check Source Files Duplicates.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Check Source Files Duplicates.vi"/>
			<Item Name="VIPB_API.Check Source Missing Dependencies.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Bld &amp; PkgLib Fldr/Library Builder Support/VIPB_API.Check Source Missing Dependencies.vi"/>
			<Item Name="VIPB List RT or FPGA Files.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB List RT or FPGA Files.vi"/>
			<Item Name="Check if File or Folder Exists [Multiple] - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Check if File or Folder Exists [Multiple] - Proxy.vi"/>
			<Item Name="Check VI License Status 2011 - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Check VI License Status 2011 - Proxy.vi"/>
			<Item Name="VIPB - Validate TPLAT configuration.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB - Validate TPLAT configuration.vi"/>
			<Item Name="Build&amp;Send Status Mesage.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/Build&amp;Send Status Mesage.vi"/>
			<Item Name="VIPB_API.FireProgressStatus.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.FireProgressStatus.vi"/>
			<Item Name="Add Palettes to Libraries.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Class Palettes/Add Palettes to Libraries.vi"/>
			<Item Name="Set Default Library Palette - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Set Default Library Palette - Proxy.vi"/>
			<Item Name="VIPB find Destination problems.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB find Destination problems.vi"/>
			<Item Name="VIPB_API.Prepare Temp Build Folders.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/Miscellaneous/VIPB_API.Prepare Temp Build Folders.vi"/>
			<Item Name="Enable-Disable Entire Menu.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/menu/Enable-Disable Entire Menu.vi"/>
			<Item Name="Defer Panel Update.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/User Interface/Defer Panel Update.vi"/>
			<Item Name="about.vi" Type="VI" URL="../../../vipm-desktop/source/Main/about.vi"/>
			<Item Name="VIPB_API.ClosePalettePreviewUI.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.ClosePalettePreviewUI.vi"/>
			<Item Name="VIPB_API.CloseVIPBMainUI.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Public/VIPB_API.CloseVIPBMainUI.vi"/>
			<Item Name="VIPB_API.HidePalettePreviewUI.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.HidePalettePreviewUI.vi"/>
			<Item Name="VIPB - Validate Recent Source Folder.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Validate Recent Source Folder.vi"/>
			<Item Name="VIPB_API.ConfirmVIPBClose.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.ConfirmVIPBClose.vi"/>
			<Item Name="VIPB_API.ResetAbortLoopRequest.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.ResetAbortLoopRequest.vi"/>
			<Item Name="VIPB - Build Root Palette or Package Menu String.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Build Root Palette or Package Menu String.vi"/>
			<Item Name="VIPB - Update Menu.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Update Menu.vi"/>
			<Item Name="VIPB - Update Menu Recent List.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Update Menu Recent List.vi"/>
			<Item Name="convert menu descriptor to menu elements.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/menu/convert menu descriptor to menu elements.vi"/>
			<Item Name="menu elements - cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/menu/menu elements - cluster -.ctl"/>
			<Item Name="VIPB - Regenerate Palette Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Regenerate Palette Dialog.vi"/>
			<Item Name="VIPM goto specific options.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM goto specific options.ctl"/>
			<Item Name="VIPB - Edit Package Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Edit Package Icon.vi"/>
			<Item Name="VIPB - Delete Recent Item from Recent List.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Delete Recent Item from Recent List.vi"/>
			<Item Name="VIPB - Get Tree Glyphs.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Miscellaneous/VIPB - Get Tree Glyphs.vi"/>
			<Item Name="Alphs Blend Glyphs .vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Image/Alphs Blend Glyphs .vi"/>
			<Item Name="Create Mask By Alpha - Advanced -.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Image/Create Mask By Alpha - Advanced -.vi"/>
			<Item Name="VIPB - Update Tree.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Advanced Settings Window Support/Miscellaneous/VIPB - Update Tree.vi"/>
			<Item Name="TREE_Tree Empty.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Tree Control Utilities/TREE_Tree Empty.vi"/>
			<Item Name="TREE_Get All.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Tree Control Utilities/TREE_Get All.vi"/>
			<Item Name="TREE_Get Children.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Tree Control Utilities/TREE_Get Children.vi"/>
			<Item Name="TREE_Get Current.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Tree Control Utilities/TREE_Get Current.vi"/>
			<Item Name="TREE_Load Symbols.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Tree Control Utilities/TREE_Load Symbols.vi"/>
			<Item Name="TREE_Item Add.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Tree Control Utilities/TREE_Item Add.vi"/>
			<Item Name="TREE_Set Symbols.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/JKI Reuse/Tree Control Utilities/TREE_Set Symbols.vi"/>
			<Item Name="VIPB - Select Destination Type.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Select Destination Type.vi"/>
			<Item Name="VIPB_API.Destination Type Radio.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Data Structures/VIPB_API.Destination Type Radio.ctl"/>
			<Item Name="VIPB - Set Destination Browse Start Path.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Set Destination Browse Start Path.vi"/>
			<Item Name="VIPB - Get Additional Destination Info by Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get Additional Destination Info by Name.vi"/>
			<Item Name="VIPB - Generate New Destination Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Generate New Destination Name.vi"/>
			<Item Name="Generate Project Source Tree.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Tree/Generate Project Source Tree.vi"/>
			<Item Name="VIPB Add Item to Tree.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Tree/VIPB Add Item to Tree.vi"/>
			<Item Name="VIPB Symbol Storage.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Tree/VIPB Symbol Storage.vi"/>
			<Item Name="Get File Icons for Mac.vi" Type="VI" URL="../../../vipm-desktop/source/platform/Get File Icons for Mac.vi"/>
			<Item Name="VIPM Traverse Tree (Breadth First).vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Tree/VIPM Traverse Tree (Breadth First).vi"/>
			<Item Name="VIPB - Update Source Files Destination Ring.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Update Source Files Destination Ring.vi"/>
			<Item Name="Update Source Files Page Controls.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Source Files Settings/Update Source Files Page Controls.vi"/>
			<Item Name="VIPB - Library Password Type.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Controls/VIPB - Library Password Type.ctl"/>
			<Item Name="VIPB LabVIEW Requirements Control.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/VIPB LabVIEW Requirements Control.ctl"/>
			<Item Name="VIPB - Edit Category Icon.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Edit Category Icon.vi"/>
			<Item Name="Palette Catergory Browser.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Category Finder/Palette Catergory Browser.vi"/>
			<Item Name="Update Palette Browser Tree.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Category Finder/Update Palette Browser Tree.vi"/>
			<Item Name="Palette Info Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Category Finder/Palette Info Cluster.ctl"/>
			<Item Name="Show Please Wait Message in Tree.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Category Finder/Show Please Wait Message in Tree.vi"/>
			<Item Name="Get all Palette Synced Directories.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Palette Utilities/Palette Category Finder/Get all Palette Synced Directories.vi"/>
			<Item Name="Match File Extension.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Match File Extension.vi"/>
			<Item Name="Match File Extension (Scalars).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Match File Extension (Support)/Match File Extension (Scalars).vi"/>
			<Item Name="Match File Extension (Array of Extensions).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Match File Extension (Support)/Match File Extension (Array of Extensions).vi"/>
			<Item Name="Match File Extension (Array of Paths).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Match File Extension (Support)/Match File Extension (Array of Paths).vi"/>
			<Item Name="Match File Name Extension (Scalars).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Match File Extension (Support)/Match File Name Extension (Scalars).vi"/>
			<Item Name="Match File Name Extension (Array of Extensions).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Match File Extension (Support)/Match File Name Extension (Array of Extensions).vi"/>
			<Item Name="Match File Name Extension (Array of Names).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/File IO/Match File Extension (Support)/Match File Name Extension (Array of Names).vi"/>
			<Item Name="VIPB Refresh Button Small.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Refresh Button Small.ctl"/>
			<Item Name="VIPM - Activation Engine.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Activation Engine.vi"/>
			<Item Name="VIPM - Activation App Data- Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Activation App Data- Cluster.ctl"/>
			<Item Name="VIPM - Registration Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/VIPM - Registration Dialog.vi"/>
			<Item Name="VIPM - Registration Dialog App Data - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Activation/Support/VIPM - Registration Dialog App Data - Cluster.ctl"/>
			<Item Name="Write to windows registry during install.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Wizard VI/Write to windows registry during install.vi"/>
			<Item Name="OGC Installer - Paths - .vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/OGC Install Core/OGC Installer - Paths - .vi"/>
			<Item Name="Cluster Strict Type Def - OGC Installer Paths - .ctl" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/OGC Install Core/Controls/Cluster Strict Type Def - OGC Installer Paths - .ctl"/>
			<Item Name="Append Platform Dependant Extension to File Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Platform Tools/Append Platform Dependant Extension to File Name.vi"/>
			<Item Name="File Type - Enum -.ctl" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Platform Tools/File Type - Enum -.ctl"/>
			<Item Name="OGC Installer - Get Build Status - .vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/OGC Install Core/OGC Installer - Get Build Status - .vi"/>
			<Item Name="Add Uninstall Entry in Add-Remove Programs.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/misc/Add Uninstall Entry in Add-Remove Programs.vi"/>
			<Item Name="Uninstall Registry Parameters Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/misc/controls/Uninstall Registry Parameters Cluster.ctl"/>
			<Item Name="VIPM Request Activation.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Update/VIPM Request Activation.vi"/>
			<Item Name="VIPM Update Registered Information.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Update Registered Information.vi"/>
			<Item Name="VIPM Get Serial Numbers.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get Serial Numbers.vi"/>
			<Item Name="VIPM Activate OK Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Activate OK Button.ctl"/>
			<Item Name="VIPM Deactivate Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Deactivate Button.ctl"/>
			<Item Name="VIPM Activate Dialog Done Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Activate Dialog Done Button.ctl"/>
			<Item Name="Set Installation Info.vi" Type="VI" URL="../../../vipm-desktop/source/OGC_Installer/Software Product Registry/Source/Set Installation Info.vi"/>
			<Item Name="VIPM Enable Disable 30day trial Menu.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Enable Disable 30day trial Menu.vi"/>
			<Item Name="VIRM Publish packages from other UIs (not API).vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Support/VIRM Publish packages from other UIs (not API).vi"/>
			<Item Name="VIPB Check for mnu files and prompt user to upgrade.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB Check for mnu files and prompt user to upgrade.vi"/>
			<Item Name="VIPB_API.GetRootPaletteIcons.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Library Builder/API/Private/VIPB_API.GetRootPaletteIcons.vi"/>
			<Item Name="VIPM Save Info for Support.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Help/VIPM Save Info for Support.vi"/>
			<Item Name="VIPB.class - Untitled VIPB Constant.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB.class - Untitled VIPB Constant.vi"/>
			<Item Name="Source Tree Browser.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/Source Tree Browser.vi"/>
			<Item Name="Disable VIPB non-library tree elements for library selection action.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/Disable VIPB non-library tree elements for library selection action.vi"/>
			<Item Name="is valid path" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/is valid path"/>
			<Item Name="VIPB - Get Additional System Destination Info by Name.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/VIPB - Main Window Support/Miscellaneous/VIPB - Get Additional System Destination Info by Name.vi"/>
			<Item Name="VIPB Perform CtrlA.vi" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Support/VIPB Perform CtrlA.vi"/>
			<Item Name="VIPM General Tree Color on Value Changed.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM General Tree Color on Value Changed.vi"/>
			<Item Name="VIPM Abort Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Abort Button.ctl"/>
			<Item Name="VIPB Cancel Editing or Clear.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/VIPB Cancel Editing or Clear.ctl"/>
			<Item Name="VIPB Custom Browse Button.ctl" Type="VI" URL="../../../vipm-desktop/source/VI Package Builder/Controls/VIPB Custom Browse Button.ctl"/>
			<Item Name="VIPB Toolbar - New Package Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Toolbar - New Package Button.ctl"/>
			<Item Name="VIPB Toolbar - Open Package Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Toolbar - Open Package Button.ctl"/>
			<Item Name="VIPB Toolbar - Save Package Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Toolbar - Save Package Button.ctl"/>
			<Item Name="VIPB Toolbar - Build Package Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Toolbar - Build Package Button.ctl"/>
			<Item Name="VIPB Toolbar - Show Package in Explorer Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Toolbar - Show Package in Explorer Button.ctl"/>
			<Item Name="VIPB Toolbar - Publish Package Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Toolbar - Publish Package Button.ctl"/>
			<Item Name="VIPM Remove X Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Remove X Button.ctl"/>
			<Item Name="VIPB Expand Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Expand Button.ctl"/>
			<Item Name="VIPB Collapse Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Collapse Button.ctl"/>
			<Item Name="VIPM Add Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Add Button.ctl"/>
			<Item Name="VIPM Edit Pencil Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Edit Pencil Button.ctl"/>
			<Item Name="VIPB Package Build Number Increment Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Package Build Number Increment Button.ctl"/>
			<Item Name="VIPB Toolbar - Share Package With Community Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPB Toolbar - Share Package With Community Button.ctl"/>
			<Item Name="Check if Upgrade Available and Upgrade Name.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/Check if Upgrade Available and Upgrade Name.vi"/>
			<Item Name="Package History Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Package Properties Window/Support/Package History Cluster.ctl"/>
			<Item Name="VIPM select list if demo.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM select list if demo.vi"/>
			<Item Name="OGPM Get Package Image.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Get Package Image.vi"/>
			<Item Name="NIPM_API.lvlib" Type="Library" URL="../../../vipm-desktop/source/submodules/nipm-api-fork/NIPM Library/NIPM_API.lvlib"/>
			<Item Name="Log In - Parse Account Creation Errors.vi" Type="VI" URL="../../../vipm-desktop/source/Login Form/Log In - Parse Account Creation Errors.vi"/>
			<Item Name="user option - enum.ctl" Type="VI" URL="../../../vipm-desktop/source/Login Form/user option - enum.ctl"/>
			<Item Name="VIPM Activation Dialog Cancel X Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Activation Dialog Cancel X Button.ctl"/>
			<Item Name="VIPM Home - Close Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Home - Close Button.ctl"/>
			<Item Name="VIPM Welcome - Free Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Welcome - Free Button.ctl"/>
			<Item Name="VIPM Welcome - Pro Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Welcome - Pro Button.ctl"/>
			<Item Name="VIPM Welcome - Community Edition Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Welcome - Community Edition Button.ctl"/>
			<Item Name="VIPM Home - Background Gradient.ctl" Type="VI" URL="../../../vipm-desktop/source/Home/Controls/VIPM Home - Background Gradient.ctl"/>
			<Item Name="Display Free Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/vipm free/Display Free Dialog.vi"/>
			<Item Name="VIPM Prompt for URL Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM Prompt for URL Dialog.vi"/>
			<Item Name="VIPM Examples (Help) Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Examples (Help) Button.ctl"/>
			<Item Name="VIPM SystemTray - Create.vi" Type="VI" URL="../../../vipm-desktop/source/SystemTray/VIPM SystemTray - Create.vi"/>
			<Item Name="NotifyIcon Events.ctl" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/TypeDefs/NotifyIcon Events.ctl"/>
			<Item Name="NotifyIcon - Create.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/NotifyIcon - Create.vi"/>
			<Item Name="NotifyIcon - Set ContextMenu.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/NotifyIcon - Set ContextMenu.vi"/>
			<Item Name="NotifyIcon - Create ContextMenu.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/SubVIs/NotifyIcon - Create ContextMenu.vi"/>
			<Item Name="NotifyIcon - Create Menu.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/SubVIs/NotifyIcon - Create Menu.vi"/>
			<Item Name="NotifyIcon - Create SubMenuItem.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/SubVIs/NotifyIcon - Create SubMenuItem.vi"/>
			<Item Name="NotifyIcon - Get MenuItem.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/NotifyIcon - Get MenuItem.vi"/>
			<Item Name="NotifyIcon Event Registration Actions.ctl" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/TypeDefs/NotifyIcon Event Registration Actions.ctl"/>
			<Item Name="NotifyIcon - Register LabVIEW User Events.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/NotifyIcon - Register LabVIEW User Events.vi"/>
			<Item Name="NotifyIcon - Register .NET Events Callback.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/SubVIs/NotifyIcon - Register .NET Events Callback.vi"/>
			<Item Name="NotifyIcon .NET Callback Parameter.ctl" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/TypeDefs/NotifyIcon .NET Callback Parameter.ctl"/>
			<Item Name="NotifyIcon Event Data.ctl" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/TypeDefs/NotifyIcon Event Data.ctl"/>
			<Item Name="NotifyIcon - Get All MenuItems.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/SubVIs/NotifyIcon - Get All MenuItems.vi"/>
			<Item Name="NotifyIcon - .NET EventCallback.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/SubVIs/NotifyIcon - .NET EventCallback.vi"/>
			<Item Name="VIPM SystemTray - Destroy.vi" Type="VI" URL="../../../vipm-desktop/source/SystemTray/VIPM SystemTray - Destroy.vi"/>
			<Item Name="NotifyIcon - Destroy.vi" Type="VI" URL="../../../vipm-desktop/source/NotifyIcon/NotifyIcon - Destroy.vi"/>
			<Item Name="VIPM Options General Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options General Button.ctl"/>
			<Item Name="VIPM Options Internet Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options Internet Button.ctl"/>
			<Item Name="VIPM Options LabVIEW Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options LabVIEW Button.ctl"/>
			<Item Name="VIPM Options Advanced Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options Advanced Button.ctl"/>
			<Item Name="VIPM Refresh Mirrors button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Refresh Mirrors button.ctl"/>
			<Item Name="VIPM Pro Options Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Pro Options Button.ctl"/>
			<Item Name="VIPM Options Package Build Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options Package Build Button.ctl"/>
			<Item Name="VIPM Options Repository Manager Tab Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options Repository Manager Tab Button.ctl"/>
			<Item Name="VIPM Options Verify Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options Verify Button.ctl"/>
			<Item Name="VIPM Options Preview Features Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Options Preview Features Button.ctl"/>
			<Item Name="github issue control hyperlink.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/github issue control hyperlink.ctl"/>
			<Item Name="Append URL to Error String.vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/Error/Append URL to Error String.vi"/>
			<Item Name="VIPM download warning mechanism.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Download Warning/VIPM download warning mechanism.vi"/>
			<Item Name="VIPM Repository TOS Dialog.vi" Type="VI" URL="../../../vipm-desktop/source/Main/VIPM Repository TOS Dialog.vi"/>
			<Item Name="VIPM Get repo URLs for package names.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM Get repo URLs for package names.vi"/>
			<Item Name="PCE package task info - cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE package task info - cluster.ctl"/>
			<Item Name="PCE_Main Window Shifter.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/controls/PCE_Main Window Shifter.ctl"/>
			<Item Name="VIPM Removed Package Attributes.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Removed Package Attributes.ctl"/>
			<Item Name="PCE Send Progress range and refnum.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Send Progress range and refnum.vi"/>
			<Item Name="PCE Handle MD5 and invalid file errors gracefully.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Handle MD5 and invalid file errors gracefully.vi"/>
			<Item Name="OGPM Invalid Format Error Message text.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Invalid Format Error Message text.vi"/>
			<Item Name="OGPM MD5 Error Message text.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM MD5 Error Message text.vi"/>
			<Item Name="OGPM Get-Set Active Virtual Environment.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Private/OGPM Get-Set Active Virtual Environment.vi"/>
			<Item Name="OGPM Install Options.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Install Options.ctl"/>
			<Item Name="OGPM Install Package File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Install Package File.vi"/>
			<Item Name="OGPM Check Pkg Platform Requirments.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Check Pkg Platform Requirments.vi"/>
			<Item Name="OGPM Extract File Groups to Target.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Extract File Groups to Target.vi"/>
			<Item Name="OGPM Strip LV Path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Strip LV Path.vi"/>
			<Item Name="OGPM Manage Installed File Counter.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Manage Installed File Counter.vi"/>
			<Item Name="OGPM Query Installed Package (All Targets).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Query Installed Package (All Targets).vi"/>
			<Item Name="PCE Get Package Paths.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Get Package Paths.vi"/>
			<Item Name="PCE Remove Empty String Rows from 2D Array.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Remove Empty String Rows from 2D Array.vi"/>
			<Item Name="PCE Remove Duplicate Rows from 2D Array.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Remove Duplicate Rows from 2D Array.vi"/>
			<Item Name="OGPM - File Counter - Write Count to File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/File Counter/OGPM - File Counter - Write Count to File.vi"/>
			<Item Name="OGPM - File Counter - Read From File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/File Counter/OGPM - File Counter - Read From File.vi"/>
			<Item Name="ZipCross Extract File (Optimized).vi" Type="VI" URL="../../../vipm-desktop/source/JKI Reuse Pool/ZipCross/ZipCross Extract File (Optimized).vi"/>
			<Item Name="VIPM ZLIB Extract File (Optimized).vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/VIPM ZLIB Extract File (Optimized).vi"/>
			<Item Name="VIPM ZLIB Read Compressed File__ogtk.vi" Type="VI" URL="../../../vipm-desktop/source/zlib hacks/VIPM ZLIB Read Compressed File__ogtk.vi"/>
			<Item Name="OGPM Expand File Groups for Target.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Expand File Groups for Target.vi"/>
			<Item Name="OGPM Check File Group OS Compatability.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Check File Group OS Compatability.vi"/>
			<Item Name="OGPM Run Package Script VI.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Run Package Script VI.vi"/>
			<Item Name="OGPM Script VIs.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Script VIs.ctl"/>
			<Item Name="OGPM Extract Pkg File to Temp Dir.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Extract Pkg File to Temp Dir.vi"/>
			<Item Name="OGPM Query Package by Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Query Package by Name.vi"/>
			<Item Name="OGPM Package Query Results Enum.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Package Query Results Enum.ctl"/>
			<Item Name="OGPM Write Lines to File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Write Lines to File.vi"/>
			<Item Name="OGPM Sort Paths by Length.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Sort Paths by Length.vi"/>
			<Item Name="OGPM Manage Uninstalled File Counter.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Manage Uninstalled File Counter.vi"/>
			<Item Name="OGPM Custom Action Data Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Custom Action Data Cluster.ctl"/>
			<Item Name="OGPM Install License File.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Install License File.vi"/>
			<Item Name="Register lvlibs.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/Pkg Task Pre and Post Support/Register lvlibs.vi"/>
			<Item Name="Copy Activation DLLs to LabVIEW.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Package Tools/Pkg Task Pre and Post Support/Copy Activation DLLs to LabVIEW.vi"/>
			<Item Name="OGPM Query Installed Packages (Fast).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Query Installed Packages (Fast).vi"/>
			<Item Name="OGPM Package Database Info - Cluster -.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Package Database Info - Cluster -.ctl"/>
			<Item Name="OGPM Query Subset of Installed Packages.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Query Subset of Installed Packages.vi"/>
			<Item Name="OGPM Extract Package key value pair by installed package file path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/OGPM Extract Package key value pair by installed package file path.vi"/>
			<Item Name="JKI - Compare Array (Path).vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Package Query/JKI - Compare Array (Path).vi"/>
			<Item Name="OGPM List NIPM Packages.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM List NIPM Packages.vi"/>
			<Item Name="array_to_set.path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/array_to_set.path.vi"/>
			<Item Name="sets.union.string.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/sets.union.string.vi"/>
			<Item Name="set.intersection.path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/set.intersection.path.vi"/>
			<Item Name="sets.difference.path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/sets.difference.path.vi"/>
			<Item Name="sets.union.path.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/sets.union.path.vi"/>
			<Item Name="array_to_set.string.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Public/array_to_set.string.vi"/>
			<Item Name="OGPM Filter (Pass) Newest Packages.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Dependency and Conflict Utilities/OGPM Filter (Pass) Newest Packages.vi"/>
			<Item Name="OGPM PkgDir Read Root Package Directory.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM PkgDir Read Root Package Directory.vi"/>
			<Item Name="OGPM Packages Info Cluster Constant.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Packages Info Cluster Constant.vi"/>
			<Item Name="OGPM List Cached Icon Files.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Cache/OGPM List Cached Icon Files.vi"/>
			<Item Name="OGPM Send Iterative Progress Message.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Messaging/OGPM Send Iterative Progress Message.vi"/>
			<Item Name="OGPM Get Scaled Iteration Progress.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Get Scaled Iteration Progress.vi"/>
			<Item Name="OGPM Post Install Tasks Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/OGPM/Type Definitions/OGPM Post Install Tasks Cluster.ctl"/>
			<Item Name="Refresh Palettes - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Refresh Palettes - Proxy.vi"/>
			<Item Name="Refresh Menus - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Refresh Menus - Proxy.vi"/>
			<Item Name="Restart LabVIEW - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Restart LabVIEW - Proxy.vi"/>
			<Item Name="Quit Specific LabVIEW - Proxy.vi" Type="VI" URL="../../../vipm-desktop/source/Moles/Mole Proxies/Quit Specific LabVIEW - Proxy.vi"/>
			<Item Name="Check Specific LabVIEW is Closed with Timeout.vi" Type="VI" URL="../../../vipm-desktop/source/Main/Add LV target/support/Check Specific LabVIEW is Closed with Timeout.vi"/>
			<Item Name="OGPM Directory.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/OGPM Directory.vi"/>
			<Item Name="OGPM VI Tree - Package File IO.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM VI Tree - Package File IO.vi"/>
			<Item Name="OGPM Build Package.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Build Package.vi"/>
			<Item Name="OGPM Run Build Time Script VI.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Run Build Time Script VI.vi"/>
			<Item Name="OGPM Build Pkg File List from Spec.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Build Pkg File List from Spec.vi"/>
			<Item Name="OGPM Add Icon to Pkg Files.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Add Icon to Pkg Files.vi"/>
			<Item Name="OGPM Append Path if Relative and Pass Absolute.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Append Path if Relative and Pass Absolute.vi"/>
			<Item Name="OGPM Add File Groups to Pkg Files.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Add File Groups to Pkg Files.vi"/>
			<Item Name="OGPM Construct File Group Source Paths and Archive Names.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Construct File Group Source Paths and Archive Names.vi"/>
			<Item Name="OGPM Add Script VIs to Pkg Files.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Add Script VIs to Pkg Files.vi"/>
			<Item Name="OGPM Create Package From Pkg Files.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Create Package From Pkg Files.vi"/>
			<Item Name="OGPM Package File Extension.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Package File Extension.vi"/>
			<Item Name="OGPM Get Spec File from Pkg.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Get Spec File from Pkg.vi"/>
			<Item Name="OGPM Get Package Name.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Get Package Name.vi"/>
			<Item Name="OGPM Get Package Description.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Get Package Description.vi"/>
			<Item Name="OGPM Log 1st TRUE Line.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Utility/OGPM Log 1st TRUE Line.vi"/>
			<Item Name="OGPM Upgrade Package.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/OGPM Upgrade Package.vi"/>
			<Item Name="OGPM Windows Install Tasks.vi" Type="VI" URL="../../../vipm-desktop/source/platform/OGPM Windows Install Tasks.vi"/>
			<Item Name="OGPM Register Extensions.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/OGPM Register Extensions.vi"/>
			<Item Name="OGPM Registry Write.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/OGPM Registry Write.vi"/>
			<Item Name="OGPM Registry Script.vi" Type="VI" URL="../../../vipm-desktop/source/platform/Windows Support/OGPM Registry Script.vi"/>
			<Item Name="OGPM Un-Register Extensions.vi" Type="VI" URL="../../../vipm-desktop/source/OpenG Derivatives/OGPM Un-Register Extensions.vi"/>
			<Item Name="OGPM Get Keys from Registry Script.vi" Type="VI" URL="../../../vipm-desktop/source/platform/Windows Support/OGPM Get Keys from Registry Script.vi"/>
			<Item Name="OGPM Get all Path Nodes from Path.vi" Type="VI" URL="../../../vipm-desktop/source/platform/Windows Support/OGPM Get all Path Nodes from Path.vi"/>
			<Item Name="OGPM Windows Uninstall Tasks.vi" Type="VI" URL="../../../vipm-desktop/source/platform/OGPM Windows Uninstall Tasks.vi"/>
			<Item Name="OGPM Build Dependencies-Conflicts String.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package File IO/Spec File IO/OGPM Build Dependencies-Conflicts String.vi"/>
			<Item Name="OGPM Mac Install Tasks.vi" Type="VI" URL="../../../vipm-desktop/source/platform/OGPM Mac Install Tasks.vi"/>
			<Item Name="OGPM Mac Uninstall Tasks.vi" Type="VI" URL="../../../vipm-desktop/source/platform/OGPM Mac Uninstall Tasks.vi"/>
			<Item Name="OGPM Linux Uninstall Tasks.vi" Type="VI" URL="../../../vipm-desktop/source/platform/OGPM Linux Uninstall Tasks.vi"/>
			<Item Name="OGPM Linux Install Tasks.vi" Type="VI" URL="../../../vipm-desktop/source/platform/OGPM Linux Install Tasks.vi"/>
			<Item Name="OGPM SFMirrors - VI Tree.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/SourceForge Mirrors File IO/OGPM SFMirrors - VI Tree.vi"/>
			<Item Name="OGPM VI Tree - PkgDir.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM VI Tree - PkgDir.vi"/>
			<Item Name="OGPM Get all Package Directories info.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/Package Directory IO/OGPM Get all Package Directories info.vi"/>
			<Item Name="OGPM VI Tree - http.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM VI Tree - http.vi"/>
			<Item Name="OGPM HTTP EXAMPLE.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/HTTP Download/OGPM HTTP EXAMPLE.vi"/>
			<Item Name="OGPM VI Tree - URL Parsing.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM VI Tree - URL Parsing.vi"/>
			<Item Name="OGPM Path to URL.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Support/URL Download and Tools/URL Parsing/OGPM Path to URL.vi"/>
			<Item Name="OGPM Lookup Package Name from Packages Info Array.vi" Type="VI" URL="../../../vipm-desktop/source/OGPM/Utility/OGPM Lookup Package Name from Packages Info Array.vi"/>
			<Item Name="VIRM General menu Build.vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/UI/Support/VIRM General menu Build.vi"/>
			<Item Name="VIPM Ctx Menu Elements Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Ctx Menu Elements Cluster.ctl"/>
			<Item Name="VIRM Test if Package is Remote.vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Private/VIRM Test if Package is Remote.vi"/>
			<Item Name="VIRM - License Pack Activation Dialog App Data - Cluster.ctl" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/UI/Support/VIRM - License Pack Activation Dialog App Data - Cluster.ctl"/>
			<Item Name="RM-Main-runtime-menu.rtm" Type="Document" URL="../../../vipm-desktop/source/Repository Manger/RM-Main-runtime-menu.rtm"/>
			<Item Name="VIPM Close Quick Filter Pane.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Close Quick Filter Pane.ctl"/>
			<Item Name="VIPM Repository Client Authorization Button.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Repository Client Authorization Button.ctl"/>
			<Item Name="VIPM Floating List Info Message Box - NOT STRICT.ctl" Type="VI" URL="../../../vipm-desktop/source/Main/Controls/VIPM Floating List Info Message Box - NOT STRICT.ctl"/>
			<Item Name="PCE Handle Delete Key.vi" Type="VI" URL="../../../vipm-desktop/source/Main/PCE Support/PCE Handle Delete Key.vi"/>
			<Item Name="VIRM Assistant Engine.vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Support/VIRM Assistant Engine.vi"/>
			<Item Name="VIPM General Tree Color on Value Changed (Multi-Select).vi" Type="VI" URL="../../../vipm-desktop/source/Main/Misc/VIPM General Tree Color on Value Changed (Multi-Select).vi"/>
			<Item Name="VIRM RepMgr - TEST -.vi" Type="VI" URL="../../../vipm-desktop/source/Repository Manger/Tests/VIRM RepMgr - TEST -.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
