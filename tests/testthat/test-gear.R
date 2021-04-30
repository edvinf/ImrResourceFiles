context("Test gear files")
NSSKmetierExample <- RstoxFDA::readMetierTable(system.file("otherfiles", "gear", "metiertable_meshed_NSSK_2020.txt", package = "ImrResourceFiles"))
expect_true(!is.null(NSSKmetierExample))
