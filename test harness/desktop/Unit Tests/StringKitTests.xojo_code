#tag Class
Protected Class StringKitTests
Inherits TestGroup
	#tag Event
		Function UnhandledException(err As RuntimeException, methodName As Text) As Boolean
		  #pragma unused err
		  
		  Const kMethodName As Text = "UnhandledException"
		  
		  If methodName.Length >= kMethodName.Length And methodName.Left(kMethodName.Length) = kMethodName Then
		    Assert.Pass("Exception was handled")
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetUnicodeCategoryTest()
		  // Passing more than one character should be the special "None" category.
		  Assert.IsTrue(StringKit.GetUnicodeCategory("ab") = _
		  StringKit.UnicodeCategories.None)
		  
		  // Close punctuation.
		  Assert.IsTrue(StringKit.GetUnicodeCategory("}") = _
		  StringKit.UnicodeCategories.ClosePunctuation)
		  Assert.IsFalse(StringKit.GetUnicodeCategory("{") = _
		  StringKit.UnicodeCategories.ClosePunctuation)
		  
		  // Connector punctuation.
		  Assert.IsTrue(StringKit.GetUnicodeCategory("︳") = _
		  StringKit.UnicodeCategories.ConnectorPunctuation)
		  Assert.IsFalse(StringKit.GetUnicodeCategory(".") = _
		  StringKit.UnicodeCategories.ConnectorPunctuation)
		  
		  // Control characters.
		  Assert.IsTrue(StringKit.GetUnicodeCategory(&u0008) = _
		  StringKit.UnicodeCategories.Control) // Backspace.
		  Assert.IsFalse(StringKit.GetUnicodeCategory("a") = _
		  StringKit.UnicodeCategories.Control)
		  
		  // Currency.
		  Assert.IsTrue(StringKit.GetUnicodeCategory("$") = _
		  StringKit.UnicodeCategories.CurrencySymbol)
		  Assert.IsTrue(StringKit.GetUnicodeCategory("£") = _
		  StringKit.UnicodeCategories.CurrencySymbol)
		  Assert.IsFalse(StringKit.GetUnicodeCategory("a") = _
		  StringKit.UnicodeCategories.CurrencySymbol)
		  
		  // Dash punctuation.
		  Assert.IsTrue(StringKit.GetUnicodeCategory("-") = _
		  StringKit.UnicodeCategories.DashPunctuation)
		  Assert.IsFalse(StringKit.GetUnicodeCategory("a") = _
		  StringKit.UnicodeCategories.DashPunctuation)
		  
		  // Decimal digits.
		  Assert.IsTrue(StringKit.GetUnicodeCategory("0") = _
		  StringKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsTrue(StringKit.GetUnicodeCategory("1") = _
		  StringKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsTrue(StringKit.GetUnicodeCategory("5") = _
		  StringKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsTrue(StringKit.GetUnicodeCategory("9") = _
		  StringKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsFalse(StringKit.GetUnicodeCategory("1.2") = _
		  StringKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsFalse(StringKit.GetUnicodeCategory("a") = _
		  StringKit.UnicodeCategories.DecimalDigitNumber)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsChopTest()
		  Assert.IsTrue(StringKit.Chop("Hello", 3) = "He")
		  Assert.IsTrue(StringKit.Chop("Test", 0) = "")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsDigitTest()
		  Assert.IsTrue(StringKit.IsDigit("1"), "1")
		  Assert.IsTrue(StringKit.IsDigit("5"), "5")
		  Assert.IsFalse(StringKit.IsDigit("20"), "20")
		  Assert.IsFalse(StringKit.IsDigit("2.5"), "2.5")
		  Assert.IsFalse(StringKit.IsDigit("4e-2"), "4e-2")
		  Assert.IsFalse(StringKit.IsDigit("a"), "a")
		  Assert.IsFalse(StringKit.IsDigit("😀"), "😀")
		  Assert.IsFalse(StringKit.IsDigit("hello"), "hello")
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
