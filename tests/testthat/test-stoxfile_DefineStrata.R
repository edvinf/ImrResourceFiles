context("Test DefineStrata files")
coastalCodStrata <- RstoxBase::DefineStratumPolygon(FileName = system.file("stoxfiles", "DefineStrata", "CoastalCodRecaStrataAFWG.txt", package = "ImrResourceFiles"))
expect_true(!is.null(coastalCodStrata))

