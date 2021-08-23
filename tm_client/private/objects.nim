## Library objects

import times
import options
import json

import enums

type
    TMSelfAccountInfo* = object
        ## Stores info about the account associated with a TwineMedia client

        id*: int
        permissions*: seq[string]
        name*: string
        email*: string
        isAdmin*: bool
        creationDate*: DateTime
        excludeTags*: seq[string]
        excludeOtherMedia*: bool
        excludeOtherLists*: bool
        excludeOtherProcesses*: bool
        excludeOtherSources*: bool
        maxUploadSize*: int64
        isApiToken*: bool
        defaultSource*: int

    TMMedia* = object
        ## Stores information about a media file.
        ## Note: "parent" will be empty if the media file has no parent, but if it does, it will contain exactly 1 TMMedia object.
            
        id*: string
        name*: string
        filename*: string
        creatorId*: int
        creatorName*: string
        size*: int64
        mime*: string
        createdOn*: DateTime
        modifiedOn*: DateTime
        fileHash*: string
        hasThumbnail*: bool
        thumbnailUrl*: string
        downloadUrl*: string
        tags*: seq[string]
        isProcessing*: bool
        processError*: string
        description*: string
        source*: int
        sourceType*: string
        sourceName*: string
        parent*: seq[TMMedia]
        children*: seq[TMMedia]

    TMInstanceInfo* = object
        ## Stores information about a TwineMedia instance
        
        version*: string
        apiVersions*: seq[string]
    
    TMTag* = object
        ## Stores information about a TwineMedia tag
        
        name*: string
        files*: int
    
    TMList* = object
        ## Stores information about a TwineMedia list
        
        id*: string
        name*: string
        description*: string
        creatorId*: int
        creatorName*: string
        listType*: TMListType
        listVisibility*: TMListVisibility
        createdOn*: DateTime
        modifiedOn*: DateTime
        sourceTags*: Option[seq[string]]
        sourceExcludeTags*: Option[seq[string]]
        sourceCreatedBefore*: Option[DateTime]
        sourceCreatedAfter*: Option[DateTime]
        sourceMime*: Option[string]
        showAllUserFiles*: Option[bool]
        itemCount*: Option[int]
        containsMedia*: Option[bool]
    
    TMSource* = object
        ## Stores information about a TwineMedia source
        
        id*: int
        sourceType*: string
        sourceTypeName*: string
        name*: string
        creatorId*: int
        creatorName*: string
        isGlobal*: bool
        mediaCount*: int
        config*: JsonNode
        schema*: JsonNode
        remainingStorage*: Option[int64]
        createdOn*: DateTime
    
    TMSourceInfo* = object
        ## Stores basic information about a TwineMedia source
        
        id*: int
        sourceType*: string
        name*: string
        creatorId*: int
        creatorName*: string
        isGlobal*: bool
        mediaCount*: int
        createdOn*: DateTime
    
    TMSourceType* = object
        ## Stores information about a TwineMedia source type
        
        sourceType*: string
        name*: string
        description*: string
        schema*: JsonNode

    TMTask* = object
        ## Stores information about a TwineMedia task
        
        id*: int
        name*: string
        isCancellable*: bool
        viewPermission*: Option[string]
        cancelPermission*: Option[string]
        isGlobal*: bool
        progressType*: TMTaskProgressType
        finishedItems*: int
        totalItems*: Option[int]
        subtask*: Option[string]
        isSucceeded*: bool
        isCancelled*: bool
        isFailed*: bool
        isCancelling*: bool
        createdOn*: DateTime
    
    TMAccount* = object
        ## Stores information about a TwineMedia account
        
        id*: int
        email*: string
        name*: string
        permissions*: seq[string]
        isAdmin*: bool
        defaultSource*: int
        defaultSourceType*: string
        defaultSourceName*: string
        filesCreated*: int
        createdOn*: DateTime