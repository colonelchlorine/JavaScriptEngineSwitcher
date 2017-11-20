﻿using System;

using JavaScriptEngineSwitcher.Core.Utilities;

namespace JavaScriptEngineSwitcher.ChakraCore
{
	/// <summary>
	/// Settings of the ChakraCore JS engine
	/// </summary>
	public sealed class ChakraCoreSettings
	{
		/// <summary>
		/// Gets or sets a flag for whether to disable any background work (such as garbage collection)
		/// on background threads
		/// </summary>
		public bool DisableBackgroundWork
		{
			get;
			set;
		}

		/// <summary>
		/// Gets or sets a flag for whether to disable native code generation
		/// </summary>
		public bool DisableNativeCodeGeneration
		{
			get;
			set;
		}

		/// <summary>
		/// Gets or sets a flag for whether to disable calls of <code>eval</code> function
		/// </summary>
		public bool DisableEval
		{
			get;
			set;
		}

		/// <summary>
		/// Gets or sets a flag for whether to enable all experimental features
		/// </summary>
		public bool EnableExperimentalFeatures
		{
			get;
			set;
		}

		/// <summary>
		/// Gets or sets a current memory limit for a runtime in bytes
		/// </summary>
		public UIntPtr MemoryLimit
		{
			get;
			set;
		}


		/// <summary>
		/// Constructs an instance of the ChakraCore settings
		/// </summary>
		public ChakraCoreSettings()
		{
			DisableBackgroundWork = false;
			DisableNativeCodeGeneration = false;
			DisableEval = false;
			EnableExperimentalFeatures = false;
			MemoryLimit = Utils.Is64BitProcess() ?
				new UIntPtr(ulong.MaxValue) : new UIntPtr(uint.MaxValue);
		}
	}
}