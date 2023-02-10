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
		Sub CharacterArrayTest()
		  Var s As String = "😀+☺️" + EndOfLine + "Hi"
		  
		  Var chars() As String = s.CharacterArray
		  
		  Assert.IsTrue(chars.Count = 6)
		  Assert.IsTrue(chars(2) = "☺️")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CharacterCountTest()
		  Var s As String
		  
		  s = "a️"
		  Assert.IsTrue(s.CharacterCount = 1)
		  
		  s = SMILEY
		  Assert.IsTrue(s.CharacterCount = 1)
		  
		  s = "ab"
		  Assert.IsFalse(s.CharacterCount = 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChopTest()
		  Var s As String
		  
		  s = "Hello"
		  Assert.IsTrue(s.Chop(3) = "He")
		  
		  s = "Test"
		  Assert.IsTrue(s.Chop(0) = "")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsTest()
		  Var s As String = "Garry Kevin John Pettet"
		  
		  Assert.IsTrue(s.Contains("Garry", False), "Test 1")
		  Assert.IsTrue(s.Contains("Garry", True), "Test 1")
		  Assert.IsFalse(s.Contains("garry", True), "Test 1")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FromArrayTest()
		  Var tmp As String = "Hello World"
		  Var s() As String = tmp.Split("")
		  
		  Assert.IsTrue(StringKit.FromArray(s, 0, 5) = "Hello")
		  Assert.IsTrue(StringKit.FromArray(s, 0) = "Hello World")
		  Assert.IsTrue(StringKit.FromArray(s, 0, 11) = "Hello World")
		  Assert.IsTrue(StringKit.FromArray(s, 6, 5) = "World")
		End Sub
	#tag EndMethod

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
		  
		  #Pragma Warning "TODO: Finish"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsDigitTest()
		  Var s As String
		  
		  // Digits.
		  s = "1"
		  Assert.IsTrue(s.IsDigit, s)
		  
		  s = "5"
		  Assert.IsTrue(s.IsDigit, s)
		  
		  // Not single digits
		  s = "20"
		  Assert.IsFalse(s.IsDigit, s)
		  
		  s = "2.5"
		  Assert.IsFalse(s.IsDigit, s)
		  
		  s = "4e-2"
		  Assert.IsFalse(s.IsDigit, s)
		  
		  s = "a"
		  Assert.IsFalse(s.IsDigit, s)
		  
		  s = "😀"
		  Assert.IsFalse(s.IsDigit, s)
		  
		  s = "hello"
		  Assert.IsFalse(s.IsDigit, s)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsUppercaseASCIICharacterTest()
		  Var s As String
		  
		  s = "A"
		  Assert.IsTrue(s.IsUppercaseASCIICharacter)
		  
		  s = "Z"
		  Assert.IsTrue(s.IsUppercaseASCIICharacter)
		  
		  s = "a"
		  Assert.IsFalse(s.IsUppercaseASCIICharacter)
		  
		  s = "z"
		  Assert.IsFalse(s.IsUppercaseASCIICharacter)
		  
		  s = "ABC"
		  Assert.IsFalse(s.IsUppercaseASCIICharacter)
		  
		  s = "abc"
		  Assert.IsFalse(s.IsUppercaseASCIICharacter)
		  
		  s = "é"
		  Assert.IsFalse(s.IsUppercaseASCIICharacter)
		  
		  s = "É"
		  Assert.IsFalse(s.IsUppercaseASCIICharacter)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MiddleCharactersTest()
		  Var s As String
		  
		  s = "Hello"
		  Assert.IsTrue(s.MiddleCharacters(1, 2) = "el")
		  
		  s = MIDDLE_TEST
		  Assert.IsTrue(s.MiddleCharacters(1, 1) = SMILEY)
		End Sub
	#tag EndMethod


	#tag Constant, Name = MIDDLE_TEST, Type = String, Dynamic = False, Default = \"0\xE2\x98\xBA\xEF\xB8\x8F2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SMILEY, Type = String, Dynamic = False, Default = \"\xE2\x98\xBA\xEF\xB8\x8F", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
